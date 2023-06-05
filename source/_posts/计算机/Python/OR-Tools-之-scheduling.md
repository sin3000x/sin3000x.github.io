---
title: OR-Tools 之 scheduling
categories:
  - 计算机
  - Python
tags:
  - ortools
mathjax: true
abbrlink: 52763
date: 2022-07-03 16:44:07
---
## 倒班问题
### 基础版
在一个 3 天的时间窗里, 每天有三班倒. 一共 4 名员工来安排倒班.

每班只给一个人, 每天一个人最多做一班 (这个人也可以放假).
<!--more-->

---

准备工作...
```python
from ortools.sat.python import cp_model

num_nurses = 4
num_shifts = 3
num_days = 3

all_nurses = range(num_nurses)
all_shifts = range(num_shifts)
all_days = range(num_days)

# creat the model
model = cp_model.CpModel()

# create the variables
shifts = {}
for n in all_nurses:
    for d in all_days:
        for s in all_shifts:
            shifts[(n, d, s)] = model.NewBoolVar('shift_n%id%is%i' % (n, d, s))
```
约束:
```python
# each shift is assigned to a single nurse per day
for d in all_days:
    for s in all_shifts:
        model.AddExactlyOne(shifts[(n, d, s)] for n in all_nurses)

# each nurse works at most one shift per day
for n in all_nurses:
    for d in all_days:
        model.AddAtMostOne(shifts[(n, d, s)] for s in all_shifts)

# distribute as evenly as possible
min_shifts_per_nurse = (num_shifts * num_days) // num_nurses
if num_shifts * num_days % num_nurses == 0:
    max_shifts_per_nurse = min_shifts_per_nurse
else:
    max_shifts_per_nurse = min_shifts_per_nurse + 1

for n in all_nurses:
    num_shifts_worked = []
    for d in all_days:
        for s in all_shifts:
            num_shifts_worked.append(shifts[(n, d, s)])
    model.Add(min_shifts_per_nurse <= sum(num_shifts_worked))
    model.Add(sum(num_shifts_worked) <= max_shifts_per_nurse)
```
模型参数设定...
```python
# update solver para
solver = cp_model.CpSolver()
solver.parameters.linearization_level = 0
# enumerate all solutions
solver.parameters.enumerate_all_solutions = True

class NursesPartialSolutionPrinter(cp_model.CpSolverSolutionCallback):
    """Print intermediate solutions."""

    def __init__(self, shifts, num_nurses, num_days, num_shifts, limit):
        cp_model.CpSolverSolutionCallback.__init__(self)
        self._shifts = shifts
        self._num_nurses = num_nurses
        self._num_days = num_days
        self._num_shifts = num_shifts
        self._solution_count = 0
        self._solution_limit = limit

    def on_solution_callback(self):
        self._solution_count += 1
        print('Solution %i' % self._solution_count)
        for d in range(self._num_days):
            print('Day %i' % d)
            for n in range(self._num_nurses):
                is_working = False
                for s in range(self._num_shifts):
                    if self.Value(self._shifts[(n, d, s)]):
                        is_working = True
                        print('\tNurse %i works shift %i' % (n, s))
                if not is_working:
                    print('\tNurse {} does not work'.format(n))
        print('='*50)
        if self._solution_count >= self._solution_limit:
            print('Stop search after %i solutions' % self._solution_limit)
            self.StopSearch()

    def solution_count(self):
        return self._solution_count
```
求解与输出...
```python
# Display the first five solutions.
solution_limit = 5
solution_printer = NursesPartialSolutionPrinter(shifts, num_nurses,
                                                num_days, num_shifts,
                                                solution_limit)

# solve
solver.Solve(model, solution_printer)
```
输出
```
Solution 1
Day 0
        Nurse 0 does not work
        Nurse 1 works shift 0
        Nurse 2 works shift 1
        Nurse 3 works shift 2
Day 1
        Nurse 0 works shift 2
        Nurse 1 does not work
        Nurse 2 works shift 1
        Nurse 3 works shift 0
Day 2
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 works shift 0
        Nurse 3 does not work
==================================================
Solution 2
Day 0
        Nurse 0 works shift 0
        Nurse 1 does not work
        Nurse 2 works shift 1
        Nurse 3 works shift 2
Day 1
        Nurse 0 does not work
        Nurse 1 works shift 2
        Nurse 2 works shift 1
        Nurse 3 works shift 0
Day 2
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 works shift 0
        Nurse 3 does not work
==================================================
Solution 3
Day 0
        Nurse 0 works shift 0
        Nurse 1 does not work
        Nurse 2 works shift 1
        Nurse 3 works shift 2
Day 1
        Nurse 0 works shift 1
        Nurse 1 works shift 2
        Nurse 2 does not work
        Nurse 3 works shift 0
Day 2
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 works shift 0
        Nurse 3 does not work
==================================================
Solution 4
Day 0
        Nurse 0 works shift 0
        Nurse 1 does not work
        Nurse 2 works shift 1
        Nurse 3 works shift 2
Day 1
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 does not work
        Nurse 3 works shift 0
Day 2
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 works shift 0
        Nurse 3 does not work
==================================================
Solution 5
Day 0
        Nurse 0 does not work
        Nurse 1 works shift 0
        Nurse 2 works shift 1
        Nurse 3 works shift 2
Day 1
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 does not work
        Nurse 3 works shift 0
Day 2
        Nurse 0 works shift 2
        Nurse 1 works shift 1
        Nurse 2 works shift 0
        Nurse 3 does not work
==================================================
Stop search after 5 solutions
```

### 进阶版

上面的问题有很多组解, 这一节中引入一个 `request`, 也就是每一个护士的志愿.

在下面的例子中, `shift_requests` 记录了 5 个护士的 7 天志愿, 比如 `[0, 0, 1]` 就表示希望这一天轮到第 3 班.

```python
num_nurses = 5
num_shifts = 3
num_days = 7
all_nurses = range(num_nurses)
all_shifts = range(num_shifts)
all_days = range(num_days)
shift_requests = [[[0, 0, 1], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 1],
                   [0, 1, 0], [0, 0, 1]],
                  [[0, 0, 0], [0, 0, 0], [0, 1, 0], [0, 1, 0], [1, 0, 0],
                   [0, 0, 0], [0, 0, 1]],
                  [[0, 1, 0], [0, 1, 0], [0, 0, 0], [1, 0, 0], [0, 0, 0],
                   [0, 1, 0], [0, 0, 0]],
                  [[0, 0, 1], [0, 0, 0], [1, 0, 0], [0, 1, 0], [0, 0, 0],
                   [1, 0, 0], [0, 0, 0]],
                  [[0, 0, 0], [0, 0, 1], [0, 1, 0], [0, 0, 0], [1, 0, 0],
                   [0, 1, 0], [0, 0, 0]]]
```
建模和约束是一样的...
```python
# create model and variables
model = cp_model.CpModel()

shifts = {}
for n in all_nurses:
    for d in all_days:
        for s in all_shifts:
            shifts[(n, d, s)] = model.NewBoolVar('shift_n%id%is%i' % (n, d, s))

# constraints
for d in all_days:
    for s in all_shifts:
        model.AddExactlyOne(shifts[(n, d, s)] for n in all_nurses)

for n in all_nurses:
    for d in all_days:
        model.AddAtMostOne(shifts[(n, d, s)] for s in all_shifts)

# distribute the shifts evenly
min_shifts_per_nurse = (num_shifts * num_days) // num_nurses
if num_shifts * num_days % num_nurses == 0:
    max_shifts_per_nurse = min_shifts_per_nurse
else:
    max_shifts_per_nurse = min_shifts_per_nurse + 1

for n in all_nurses:
    num_shifts_worked = 0
    for d in all_days:
        for s in all_shifts:
            num_shifts_worked += shifts[(n, d, s)]
    model.Add(min_shifts_per_nurse <= num_shifts_worked)
    model.Add(num_shifts_worked <= max_shifts_per_nurse)
```
不过现在有一个目标函数, 希望被满足的志愿最大化:
```python
# objective
model.Maximize(
    sum(
        shift_requests[n][d][s] * shifts[(n, d, s)] 
        for n in all_nurses 
        for d in all_days 
        for s in all_shifts
    )
)
```
求解与输出...
```python
solver = cp_model.CpSolver()
status = solver.Solve(model)

if status == cp_model.OPTIMAL:
    print('Solution:')
    for d in all_days:
        print('Day', d)
        for n in all_nurses:
            for s in all_shifts:
                if solver.Value(shifts[(n, d, s)]) == 1:
                    if shift_requests[n][d][s] == 1:
                        print('Nurse', n, 'works shift', s, '(requested).')
                    else:
                        print('Nurse', n, 'works shift', s, '(not requested).')
        print()
    print(f'Number of shift requests met = {solver.ObjectiveValue()}', f'(out of {num_nurses*min_shifts_per_nurse})')
else:
    print('No optimal solution found.')
```
输出
```
Solution:
Day 0
Nurse 1 works shift 0 (not requested).
Nurse 2 works shift 1 (requested).
Nurse 3 works shift 2 (requested).

Day 1
Nurse 1 works shift 0 (not requested).
Nurse 2 works shift 1 (requested).
Nurse 4 works shift 2 (requested).

Day 2
Nurse 0 works shift 2 (not requested).
Nurse 3 works shift 0 (requested).
Nurse 4 works shift 1 (requested).

Day 3
Nurse 0 works shift 2 (not requested).
Nurse 2 works shift 0 (requested).
Nurse 3 works shift 1 (requested).

Day 4
Nurse 0 works shift 2 (requested).
Nurse 1 works shift 1 (not requested).
Nurse 4 works shift 0 (requested).

Day 5
Nurse 0 works shift 2 (not requested).
Nurse 3 works shift 0 (requested).
Nurse 4 works shift 1 (requested).

Day 6
Nurse 0 works shift 2 (requested).
Nurse 1 works shift 1 (not requested).
Nurse 2 works shift 0 (not requested).

Number of shift requests met = 13.0 (out of 20)
```

## 工程分配问题
### 背景
一个 job 由几个 task 组成, 它们之间有先后次序的要求. 每个 task 有对应的机器, 其中一个机器只能一次完成一个 task.

每个 task 有自己的完成时间, 而这个 task 一旦在机器上开始就必须做完.

比如下面这个例子:
```python
job0 = [(0, 3), (1, 2), (2, 2)]
job1 = [(0, 2), (2, 1), (1, 4)]
job2 = [(1, 4), (2, 3)]
```
意思是 `job0` 由三个 task 组成, 第一个在机器 0 上完成, 需要 3 个时间单位; 第二个在机器 1 上完成, 需要 2 个时间单位; 第三个在机器 2 上完成, 需要 2 个时间单位. 同理对 `job1` 和 `job2`. 

一个可能的方案如图:
![](https://s2.loli.net/2023/04/21/R9ih65I4yPTNQco.png)

这个并不是最优解, 我们希望最小化总时间.

### 建模
我们记 $t_{i,j}$ 为 task (i, j) 的开始时间, 其中 task (i, j) 指的是 job i 的第 j 个 task. 比如上面的例子中, task (0, 2) 对应的是 `(1, 2)`, task (0, 3) 对应的是 `(2, 2)`.

**优先级约束**

必须先完成 task (0, 2), 再开始 task (0, 3). 而 task (0, 2) 需要 2 个时间单位来完成, 所以有
$$
t_{0,2} + 2 \le t_{0,3}
$$

**不重叠约束**

task (0, 2) 和 task (2, 1) 都在机器 1 上完成, 而工作时间分别为 2 和 4. 所以, 以下两个约束中的一个成立:

$$
t_{0,2} + 2 \le t_{2,1}
$$
或
$$
t_{2,1} + 4 \le t_{0,2}.
$$

**目标函数**

最小化时间跨度, 也就是从最早的开始时间到最晚的结束时间.

### 求解
导包与数据...
```python
import collections
from ortools.sat.python import cp_model

# data...
jobs_data = [
    [(0, 3), (1, 2), (2, 2)],
    [(0, 2), (2, 1), (1, 4)],
    [(1, 4), (2, 3)]
]

machines_count = 1 + max(task[0] for job in jobs_data for task in job)
all_machines = range(machines_count)
# the sum of all durations
horizon = sum(task[1] for job in jobs_data for task in job)
```
建模与变量...
```python
model = cp_model.CpModel()

# variables...
task_type = collections.namedtuple('task_type', 'start end interval')
assigned_task_type = collections.namedtuple('assigned_task_type', 'start job index duration')

all_tasks = {}
machine_to_intervals = collections.defaultdict(list)

for job_id, job in enumerate(jobs_data):
    for task_id, task in enumerate(job):
        machine = task[0]
        duration = task[1]
        suffix = '_%i_%i' % (job_id, task_id)
        start_var = model.NewIntVar(0, horizon, 'start' + suffix)
        end_var = model.NewIntVar(0, horizon, 'end' + suffix)
        interval_var = model.NewIntervalVar(start_var, duration, end_var, 'interval' + suffix)
        all_tasks[job_id, task_id] = task_type(start=start_var, end=end_var, interval=interval_var)
        machine_to_intervals[machine].append(interval_var)
```
约束...
```python
# disjunctive constraints
for machine in all_machines:
    model.AddNoOverlap(machine_to_intervals[machine])

# precidences inside a job
for job_id, job in enumerate(jobs_data):
    for task_id in range(len(job)-1):
        model.Add(all_tasks[job_id, task_id+1].start >= all_tasks[job_id, task_id].end)
```
目标函数...
```python
# objective...
obj_var = model.NewIntVar(0, horizon, 'makespan')
model.AddMaxEquality(obj_var, [
    all_tasks[job_id, len(job)-1].end for job_id, job in enumerate(jobs_data)
])

model.Minimize(obj_var)
```
求解与输出...
```python
# solve...
solver = cp_model.CpSolver()
status = solver.Solve(model)

# results...
if status == cp_model.OPTIMAL or status == cp_model.FEASIBLE:
    print('Solution:')
    # create one list of assigned tasks per machine
    assigned_jobs = collections.defaultdict(list)
    for job_id, job in enumerate(jobs_data):
        for task_id, task in enumerate(job):
            machine = task[0]
            assigned_jobs[machine].append(
                assigned_task_type(start=solver.Value(all_tasks[job_id, task_id].start),
                job=job_id,
                index=task_id,
                duration=task[1])
            )
    # create per machine output lines
    output = ''
    for machine in all_machines:
        # sort by starting time
        assigned_jobs[machine].sort()
        sol_line_tasks = 'Machine ' + str(machine) + ': '
        sol_line = '\t'

        for assigned_task in assigned_jobs[machine]:
            name = 'job_%i_task_%i' % (assigned_task.job, assigned_task.index)
            # align columns
            sol_line_tasks += '%-15s' % name

            start = assigned_task.start
            duration = assigned_task.duration
            sol_tmp = '[%i, %i]' % (start, start + duration)
            # align columns
            sol_line += '%-15s' % sol_tmp

        sol_line += '\n'
        sol_line_tasks += '\n'
        output += sol_line_tasks
        output += sol_line

    # print the solution
    print(f'Optimal Schedule Length: {solver.ObjectiveValue()}')
    print(output)
else:
    print('No solution found.')
```
输出:
```
Solution:
Optimal Schedule Length: 11.0
Machine 0: job_1_task_0   job_0_task_0   
        [0, 2]         [2, 5]         
Machine 1: job_2_task_0   job_0_task_1   job_1_task_2   
        [0, 4]         [5, 7]         [7, 11]        
Machine 2: job_1_task_1   job_2_task_1   job_0_task_2   
        [2, 3]         [4, 7]         [7, 9]    
```
![](https://s2.loli.net/2023/04/21/GenOdly3LsITXif.png)
