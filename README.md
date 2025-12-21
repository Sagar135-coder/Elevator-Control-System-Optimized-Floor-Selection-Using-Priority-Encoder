# Elevator Control System Optimized Floor Selection Using Priority Encoder
##  Introduction

Modern elevator control systems must efficiently manage multiple floor requests while
minimizing travel time and unnecessary stops. Traditional elevator systems often process
requests sequentially, which can lead to increased waiting time and inefficient movement,
especially during peak usage.

This project, Elevator Control System – Optimized Floor Selection Using Priority Encoder,
addresses this challenge by implementing a priority-based floor selection mechanism
for an 8-floor building using SystemVerilog. The system employs an 8-to-3 priority
encoder that evaluates all active floor requests simultaneously and selects the
highest-priority (highest-numbered) floor for service.

The design is implemented using three different modeling approaches—gate-level,
behavioral, and dataflow—to demonstrate flexibility in digital design and to compare
implementation trade-offs. To ensure correctness and robustness, each design is verified
using a SystemVerilog object-oriented (OOP) testbench framework incorporating
packages, interfaces, inheritance, and virtual functions.

Through exhaustive simulation and waveform analysis using Vivado, the project validates
accurate priority encoding under all possible input conditions, highlighting the
effectiveness of priority encoders in optimizing elevator control systems.



## ***What is a priority encoder***
A priority encoder is a combinational digital circuit that converts multiple input
signals into a compact binary representation by assigning priority to each input and
encoding only the highest-priority active request. In the context of this project, an
8-to-3 priority encoder is used to process floor requests in an 8-floor elevator system.
When multiple floor buttons are pressed simultaneously, the encoder evaluates all inputs
at the same time and outputs a 3-bit binary code corresponding to the highest-numbered
(active) floor, ensuring efficient and deterministic floor selection. This approach
eliminates ambiguity present in conventional encoders and avoids sequential request
processing, thereby reducing unnecessary stops and improving elevator response time.
Priority encoders are widely used in real-world systems such as elevator controllers,
interrupt handling circuits, and arbitration logic, where multiple competing requests
must be resolved quickly and reliably.


## ***Design and Implementation***
### Gate level design diagram ###
![image](https://github.com/sagar-c-s/Elevator-Control-System-Optimized-Floor-Selection-Using-Priority-Encoder/blob/main/structural_nor.jpg?raw=true)

### Behavioral design diagram  ###
![image](https://github.com/sagar-c-s/Elevator-Control-System-Optimized-Floor-Selection-Using-Priority-Encoder/blob/main/Behavioral.jpg?raw=true)

### Data flow design diagram ###
![image](https://github.com/sagar-c-s/Elevator-Control-System-Optimized-Floor-Selection-Using-Priority-Encoder/blob/main/Dataflow_nand.jpg?raw=true)

## Working

The working of the **Elevator Control System using a Priority Encoder** involves processing
multiple floor requests and selecting the highest-priority floor for elevator movement.
The step-by-step operation of the system is explained below:

### 1. Initialization
- The elevator control system begins with an initialization phase.
- At startup, all floor request inputs are set to logic `0`, indicating no active requests.
- The output of the priority encoder is initialized to a default value (typically `000`),
  ensuring a known and stable starting state for the system.
- This guarantees predictable system behavior during simulation and verification.

### 2. Floor Request Input Handling
- Each floor in the 8-floor building is represented by one input line of the priority encoder.
- When a floor button is pressed, the corresponding input line becomes logic `1`.
- Multiple floor buttons can be pressed simultaneously, resulting in multiple active inputs.
- All floor request inputs are evaluated in parallel, not sequentially.

### 3. Priority Encoder Operation
- The system uses an **8-to-3 priority encoder** to process the floor requests.
- Each input is assigned a fixed priority, where the **highest-numbered floor has the highest priority**.
- If multiple inputs are active at the same time, the encoder selects only the
  highest-priority active input.
- The encoder generates a **3-bit binary output** corresponding to the selected floor number.

### 4. Floor Selection and Output Generation
- Based on the encoder logic, the output updates immediately when input requests change.
- For example, if floor requests for floors 2, 5, and 7 are active simultaneously,
  the encoder output will correspond to floor 7 (`111`).
- This ensures efficient elevator operation by minimizing unnecessary intermediate stops.

### 5. Implementation Variants
- The priority encoder is implemented using three different design approaches:
  - **Gate-Level Design:** Uses only NOR gates with manually derived logic equations.
  - **Behavioral Design:** Uses high-level SystemVerilog constructs such as `if-else` and `case`.
  - **Dataflow Design:** Uses Boolean expressions constructed entirely from NAND gates.
- Although the internal implementations differ, all variants produce identical functional outputs.

### 6. Testing and Verification using OOP Concepts
- Verification is performed using **SystemVerilog object-oriented programming (OOP)** techniques.
- The testbench is structured using:
  - Packages for shared definitions
  - Interfaces for signal connectivity
  - Base and derived classes with virtual methods
- Test cases include:
  - Single active floor requests
  - Multiple simultaneous floor requests
  - Exhaustive testing of all possible input combinations
- Self-checking logic compares the actual encoder output with the expected output to ensure correctness.

### 7. Summary
- In summary, the elevator control system efficiently handles multiple floor requests by
  prioritizing the highest requested floor using a priority encoder.
- The use of parallel input evaluation, deterministic priority logic, and OOP-based
  verification ensures reliable, scalable, and maintainable system design.
- Simulation results and waveform analysis confirm correct operation across all design styles.

### ***Excitation Table*** ###
![image](https://github.com/sagar-c-s/Elevator-Control-System-Optimized-Floor-Selection-Using-Priority-Encoder/blob/main/encoder_8x3_table-850x583.webp?raw=true)


<br>

##	***Working of Code*** ##

The elevator control system is implemented as an **8-to-3 priority encoder** and verified
using **SystemVerilog object-oriented programming (OOP)** concepts. The working of the
code for each design approach is described below.

### 1. Gate-Level Design (NOR Gates Only) – OOP Based

- In this approach, the priority encoder logic is implemented using **only NOR gates**,
  which are functionally universal.
- A **base class** is defined to represent a generic NOR gate with a virtual `perform()`
  function.
- **Derived classes** such as 2-input, 3-input, and 4-input NOR gates override the
  `perform()` function to implement specific gate behavior.
- These gate objects are instantiated and interconnected to manually form the complete
  priority encoder logic.
- Each floor request input is processed through a network of NOR gates to determine
  the highest-priority active floor.
- The encoder outputs a **3-bit binary value** corresponding to the highest requested
  floor.
- Verification is performed using an OOP-based testbench with **for-loop driven
  self-checking**, where all possible input combinations are applied and the output is
  automatically compared with the expected result.
- This design provides detailed control over gate-level behavior and closely reflects
  real hardware implementation.

---

### 2. Behavioral Design – OOP Based

- In the behavioral approach, the priority encoder logic is described using **high-level
  SystemVerilog constructs** such as `if-else` and `case` statements.
- Logical operations such as AND, OR, and NOT are abstracted using **OOP classes**.
- A **base class** defines a virtual logic operation, while **derived classes** implement
  specific gate functionality.
- The priority encoder evaluates all floor request inputs in parallel and applies
  conditional statements to select the highest-priority active input.
- The selected floor number is encoded as a **3-bit output**, representing the elevator’s
  next destination.
- The OOP-based structure promotes **modularity, reusability, and polymorphism**, making
  the design easy to extend or modify.
- Verification is performed using a task-based OOP testbench, where individual test
  scenarios such as single and multiple floor requests are executed and validated.

---

### 3. Dataflow Design (NAND Gates Only) – OOP Based

- In this approach, the priority encoder is implemented using **Boolean expressions
  constructed entirely from NAND gates**.
- A **base NAND gate class** defines a virtual `perform()` function representing NAND
  behavior.
- **Derived classes** are created for different input sizes (2-input, 3-input, 4-input
  NAND gates).
- Continuous assignments are used to describe the dataflow logic while adhering strictly
  to NAND-only constraints.
- The NAND gate objects collectively implement the priority encoder logic that determines
  the highest active floor request.
- The output is generated as a **3-bit encoded floor number**.
- Verification uses an OOP-based self-checking testbench that compares the actual output
  of the design with expected values for each input condition.
- This design emphasizes functional abstraction while maintaining gate-level correctness.

---

### 4. Summary

- All three designs implement the same priority encoder functionality but use different
  modeling techniques.
- OOP concepts such as **inheritance, polymorphism, abstraction, and encapsulation** are
  consistently applied across all designs.
- The gate-level design emphasizes hardware accuracy, the behavioral design improves
  readability, and the dataflow design balances abstraction with gate-level constraints.
- Simulation and waveform analysis confirm correct and consistent behavior for all
  implementations.


##  Results and Discussion

The 8-to-3 priority encoder–based elevator control system was successfully designed and
verified using SystemVerilog. The system correctly selects the highest-priority floor when
multiple requests occur simultaneously and generates the corresponding 3-bit output.
All three implementations—Gate-Level (NOR), Behavioral, and Dataflow (NAND)—produced
identical and correct results across all test cases. Simulation waveforms and self-checking
testbenches confirm stable, reliable, and efficient operation.


### ***Waveform Gate level design*** ###
![image](https://github.com/sagar-c-s/Elevator-Control-System-Optimized-Floor-Selection-Using-Priority-Encoder/blob/main/gatalevel_waveform.jpg?raw=true)

### ***Waveform Behavioral design*** ###
![image](https://github.com/tusharshenoy/3-BIT-Gray-Code-Counter/assets/107348474/12835970-754c-4663-adec-82cda67a865b)

### ***Waveform Data flow design*** ###
![image](https://github.com/tusharshenoy/3-BIT-Gray-Code-Counter/assets/107348474/12835970-754c-4663-adec-82cda67a865b)


##	***Conclusion*** ##

In conclusion, the project successfully designed a 3-bit gray code counter using
D flip-flops, featuring a synchronous reset. The detailed code implementation is
provided in this report, a comprehensive discussion about the counter's intended
behavior is also included. The designed Gray Code Counter efficiently generates the
cyclic sequence: 000, 001, 011, 010, 110, 111, 101, 100.
The 3-bit Gray Code Counter holds potential applications and they are widely
used in rotary encoders to precisely measure rotation, avoiding errors that could arise
from traditional binary counting methods.
In simple term a gray code counter is a special type of counter that counts in a
specific way, it goes up from 000 till 100. These key features collectively contribute to
the counter's effectiveness and versatility, making it a valuable component for various
applications that require sequential and cyclic behavior. A detailed code and
explanation of the same along with the output waveform is included in this report


##	***References*** ##

1. Javatpoint. Verilog Gray Counter. Retrieved from https:[//www.javatpoint.com/verilog-gray-counter](//www.javatpoint.com/verilog-gray-counter)

2. YouTube. 3-Bit gray code counters circuit diagram. Retrieved from https:[//www.youtube.com/watch?v=gRH_gSrSk8k](//www.youtube.com/watch?v=gRH_gSrSk8k)

3. BrainKart. Synchronous counter design. Retrieved from https:[//www.brainkart.com/article/Design-ofSynchronous-Counters_12975/](//www.brainkart.com/article/Design-ofSynchronous-Counters_12975/)
