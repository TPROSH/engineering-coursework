# Engineering Coursework Repository: C, Python, Embedded Systems & Scientific Computing

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![GCC](https://img.shields.io/badge/C-GCC%2011%2B-00599C?logo=c)
![Python](https://img.shields.io/badge/Python-3.8%2B-3776AB?logo=python)
![Embedded](https://img.shields.io/badge/Microcontroller-Intel%208051-orange?logo=microchip)
![MATLAB](https://img.shields.io/badge/MATLAB-R2024-e16726?logo=mathworks)

A curated, semester-wise repository containing foundational and advanced engineering coursework across **C Programming**, **Python Programming**, **Numerical Methods & Scientific Computing**, **Embedded Systems (8051 Assembly)**, **Linear Control Systems**, **Data Structures & Algorithms (DSA)**, and **Applied AI & Machine Learning**.

Every single experiment and project script has been inspected, standardized with descriptive naming, cleaned of build artifacts, and documented with comprehensive usage instructions.

---

## Authors & Contributors

This coursework repository is co-developed and maintained by:

| Contributor | Role | GitHub Profile |
| :---: | :---: | :---: |
| <a href="https://github.com/TPROSH"><img src="https://github.com/TPROSH.png?size=100" width="100px;" alt="Roshan"/><br /><sub><b>Roshan</b></sub></a><br /> | **Primary Author** | [@TPROSH](https://github.com/TPROSH) |
| <a href="https://github.com/AnshulPareek"><img src="https://github.com/AnshulPareek.png?size=100" width="100px;" alt="Anshul Pareek"/><br /><sub><b>Anshul Pareek</b></sub></a><br /> | **Co-Author** | [@AnshulPareek](https://github.com/AnshulPareek) |

---

## Directory Structure

```text
semester code
├── .gitignore
├── Semester_01_C_Programming
│   ├── README.md
│   ├── lab01_basics_and_io
│   │   ├── lab01_add_two_numbers.c
│   │   ├── lab01_arithmetic_operations.c
│   │   ├── lab01_celsius_to_fahrenheit.c
│   │   ├── lab01_data_types_io.c
│   │   ├── lab01_even_odd_checker.c
│   │   ├── lab01_rectangle_perimeter.c
│   │   ├── lab01_student_info_display.c
│   │   ├── lab01_time_hours_to_minutes.c
│   │   └── lab01_user_profile_scanner.c
│   ├── lab02_control_flow_and_loops
│   │   ├── lab02_check_numbers_equal.c
│   │   ├── lab02_day_of_week_switch.c
│   │   ├── lab02_first_10_natural_numbers.c
│   │   ├── lab02_largest_of_three_numbers.c
│   │   ├── lab02_loop_forward_reverse_count.c
│   │   ├── lab02_positive_negative_checker.c
│   │   ├── lab02_quadratic_equation_roots.c
│   │   └── lab02_sum_until_zero_sentinel.c
│   ├── lab03_functions_and_math
│   │   ├── lab03_binary_line_pattern.c
│   │   ├── lab03_circle_properties.c
│   │   ├── lab03_function_addition.c
│   │   ├── lab03_function_multiplication_params.c
│   │   ├── lab03_function_subtraction.c
│   │   └── lab03_prime_number_checker.c
│   ├── lab04_arrays_and_matrices
│   │   ├── lab04_1d_array_io.c
│   │   ├── lab04_array_copy.c
│   │   ├── lab04_count_duplicates.c
│   │   ├── lab04_matrix_linear_combination.c
│   │   └── lab04_negative_elements_filter.c
│   ├── lab05_pointers_and_references
│   │   ├── lab05_array_sum_by_function_pointer.c
│   │   ├── lab05_pointer_addition.c
│   │   ├── lab05_pointer_address_and_dereference.c
│   │   ├── lab05_pointer_arithmetic_operations.c
│   │   └── lab05_pointer_reassignment.c
│   ├── lab06_string_manipulation
│   │   ├── lab06_count_alphabets_digits_specials.c
│   │   ├── lab06_string_concatenation.c
│   │   ├── lab06_string_copy.c
│   │   ├── lab06_string_length.c
│   │   └── lab06_string_reversal.c
│   ├── lab07_structures
│   │   ├── lab07_book_structure_max_price.c
│   │   └── lab07_student_structure_average.c
│   └── lab08_file_handling
│       ├── lab08_file_library_records.c
│       ├── lab08_file_read_fscanf.c
│       └── lab08_file_write_read_putw_getw.c
├── Semester_02_Python_Programming
│   ├── README.md
│   ├── lab01_basics_and_data_types
│   │   ├── lab01_celsius_to_fahrenheit.py
│   │   ├── lab01_complex_number_arithmetic.py
│   │   ├── lab01_factorial_calculation.py
│   │   ├── lab01_geometry_area_and_perimeter.py
│   │   ├── lab01_list_operations_basics.py
│   │   ├── lab01_math_exp_and_gcd.py
│   │   ├── lab01_math_sqrt_and_power.py
│   │   ├── lab01_multiline_string_and_comments.py
│   │   ├── lab01_print_formatting_and_variables.py
│   │   └── lab01_time_converter_hours_to_seconds.py
│   ├── lab02_control_flow_and_loops
│   │   ├── lab02_bmi_calculator.py
│   │   ├── lab02_count_letters_digits_specials.py
│   │   ├── lab02_even_numbers_in_range.py
│   │   ├── lab02_even_odd_checker.py
│   │   ├── lab02_factorial_fraction_series_sum.py
│   │   ├── lab02_for_loop_natural_numbers.py
│   │   ├── lab02_function_eval_fx.py
│   │   ├── lab02_list_input_and_iteration.py
│   │   ├── lab02_multiplication_table.py
│   │   ├── lab02_password_authentication_system.py
│   │   ├── lab02_password_update_loop.py
│   │   ├── lab02_prime_checker.py
│   │   ├── lab02_quadratic_roots_calculator.py
│   │   ├── lab02_sentinel_infinite_while_loop.py
│   │   ├── lab02_sign_checker_pos_neg_zero.py
│   │   ├── lab02_sum_range_numbers.py
│   │   └── lab02_while_loop_natural_numbers.py
│   ├── lab03_data_structures_collections
│   │   ├── lab03_count_positives_negatives_in_list.py
│   │   ├── lab03_dictionary_builtin_functions_demo.py
│   │   ├── lab03_dictionary_key_membership_checker.py
│   │   ├── lab03_dictionary_length_inspection.py
│   │   ├── lab03_even_numbers_1_to_1000.py
│   │   ├── lab03_filter_divisible_by_three.py
│   │   ├── lab03_list_color_manipulations.py
│   │   ├── lab03_list_of_tuples_number_and_cube.py
│   │   ├── lab03_mixed_datatype_tuple.py
│   │   ├── lab03_nested_sublist_extend.py
│   │   ├── lab03_numerical_sum_and_mean_isinstance.py
│   │   ├── lab03_second_largest_using_set.py
│   │   ├── lab03_semester_subjects_dictionary.py
│   │   ├── lab03_set_creation_and_modification.py
│   │   ├── lab03_set_union_and_intersection.py
│   │   ├── lab03_split_list_into_halves.py
│   │   ├── lab03_tuple_functions_min_max_len_count.py
│   │   └── lab03_tuple_min_max_search.py
│   └── lab04_strings_functions_and_lambdas
│       ├── lab04_character_search_and_split.py
│       ├── lab04_function_circle_geometry.py
│       ├── lab04_function_cube_of_number.py
│       ├── lab04_function_even_odd_checker.py
│       ├── lab04_function_factorial.py
│       ├── lab04_function_max_of_three.py
│       ├── lab04_function_palindrome_checker.py
│       ├── lab04_function_power_calculation.py
│       ├── lab04_function_prime_and_armstrong.py
│       ├── lab04_function_print_natural_numbers.py
│       ├── lab04_lambda_filter_divisible_by_11.py
│       ├── lab04_sentence_case_and_word_count.py
│       ├── lab04_string_character_deletion_slicing.py
│       ├── lab04_string_concatenation_join.py
│       ├── lab04_string_equality_comparison.py
│       ├── lab04_string_first_and_last_char.py
│       ├── lab04_string_length.py
│       ├── lab04_string_rotation_left_right.py
│       └── lab04_vowel_checker.py
├── Semester_03_Numerical_Methods_MATLAB
│   ├── README.md
│   ├── exp01_matlab_variables_and_operations
│   │   └── exp01_three_variable_arithmetic.m
│   ├── exp02_matrix_operations
│   │   └── exp02_matrix_arithmetic_and_manipulation.m
│   ├── exp03_roots_geometry_and_linear_systems
│   │   ├── exp03_compound_interest_calculation.m
│   │   ├── exp03_cone_geometry_analysis.m
│   │   ├── exp03_cone_surface_area_and_volume.m
│   │   ├── exp03_hypotenuse_calculator.m
│   │   ├── exp03_linear_system_solver_3x3.m
│   │   ├── exp03_nonlinear_roots.m
│   │   └── exp03_quadratic_roots.m
│   ├── exp04_loops_and_algorithms
│   │   ├── exp04_compound_growth_years_target.m
│   │   ├── exp04_cramers_rule_linear_solver.m
│   │   ├── exp04_even_odd_checker.m
│   │   ├── exp04_factorial_calculator.m
│   │   ├── exp04_prime_number_checker.m
│   │   ├── exp04_student_grade_evaluator.m
│   │   └── exp04_sum_first_20_natural_numbers.m
│   ├── exp05_2d_and_3d_plotting
│   │   ├── exp05_3d_surface_plot_linear.m
│   │   ├── exp05_3d_trigonometric_trajectory.m
│   │   ├── exp05_assignment_radial_surface_plot.m
│   │   ├── exp05_linear_plot_mx_plus_c.m
│   │   ├── exp05_meshgrid_surface_plot.m
│   │   ├── exp05_power_function_plots.m
│   │   └── exp05_trigonometric_plots.m
│   ├── exp06_bisection_root_finding
│   │   ├── exp06_bisection_polynomial_cubic.m
│   │   ├── exp06_bisection_polynomial_quadratic.m
│   │   └── exp06_bisection_transcendental_exp.m
│   ├── exp07_newton_raphson_and_secant
│   │   ├── exp07_newton_raphson_manual_derivative.m
│   │   ├── exp07_newton_raphson_symbolic_derivative.m
│   │   └── exp07_secant_method_cubic_root.m
│   ├── exp08_euler_ode_method
│   │   └── exp08_euler_ode_initial_value_problem.m
│   ├── exp09_trapezoidal_numerical_integration
│   │   ├── exp09_trapezoidal_rule_sin_x.m
│   │   ├── exp09_trapezoidal_rule_x_sin_x.m
│   │   └── exp09_trapezoidal_rule_x_squared.m
│   ├── exp10_simpsons_numerical_integration
│   │   ├── exp10_simpsons_one_third_rule_rational.m
│   │   └── exp10_simpsons_three_eighth_rule_linear.m
│   ├── lab_reports_pdf
│   │   ├── lab_report_question_01.pdf
│   │   ├── lab_report_question_02.pdf
│   │   ├── lab_report_question_03.pdf
│   │   ├── nml_report_clean.pdf
│   │   └── nml_report_watermarked.pdf
│   ├── misc_scripts_and_visualizations
│   │   ├── bisection_auto_interval_finder.m
│   │   ├── cone_geometry_calculator.m
│   │   ├── high_degree_polynomial_surface.m
│   │   ├── interactive_lab04_algorithms.mlx
│   │   ├── interactive_lab05_plotting.mlx
│   │   ├── linear_system_3x3_solver.m
│   │   ├── parametric_3d_trig_curve.m
│   │   ├── power_curves_comparison.m
│   │   ├── saved_workspace_data.mat
│   │   ├── sphere_volume_and_area.m
│   │   └── x_sinx_integral_simpson.m
│   └── projects_and_simulink
│       ├── electrical_network_simulation.slx
│       ├── psim_power_systems_simulation.slx
│       └── traffic_density_ode_numerical_solutions.m
├── Semester_04_Control_and_Embedded_Systems
│   ├── README.md
│   ├── linear_control_systems_matlab
│   │   ├── control_system_stepinfo_test.m
│   │   ├── coursework_assignments
│   │   │   ├── ass02_second_order_step_response.m
│   │   │   ├── ass02_varying_time_constant_step.m
│   │   │   ├── ass03_damping_ratio_zeta_effects.m
│   │   │   ├── ass03_natural_frequency_wn_effects.m
│   │   │   ├── ass03_second_order_zeta_sweep_step.m
│   │   │   ├── ass04_bode_plot_analysis
│   │   │   │   ├── bode_lead_lag_grid.m
│   │   │   │   ├── bode_lead_lag_system.m
│   │   │   │   ├── bode_logspace_100_points.m
│   │   │   │   ├── bode_logspace_5_points.m
│   │   │   │   ├── bode_manual_frequency_points.m
│   │   │   │   ├── bode_third_order_frequency_response.m
│   │   │   │   └── bode_third_order_open_loop.m
│   │   │   ├── ass05_root_locus_analysis
│   │   │   │   ├── breakaway_points_symbolic_diff.m
│   │   │   │   ├── nyquist_and_gain_margins.m
│   │   │   │   ├── root_locus_and_step_gain_k1449.m
│   │   │   │   ├── root_locus_third_order_system.m
│   │   │   │   ├── root_locus_unstable_pole_system.m
│   │   │   │   ├── step_response_gain_k2.m
│   │   │   │   └── step_response_tuned_gain_k1386.m
│   │   │   └── ass08_pid_controller_feedback.slx
│   │   ├── lab01_signals_and_plotting
│   │   │   ├── lab01_linear_ramp_plot.m
│   │   │   ├── lab01_matrix_nested_loop_generator.m
│   │   │   └── lab01_subplot_signals_comparison.m
│   │   ├── lab02_vector_and_matrix_algebra
│   │   │   ├── lab02_block_matrix_eye_zeros_ones_diag.m
│   │   │   ├── lab02_matrix_column_concatenation.m
│   │   │   ├── lab02_matrix_row_stacking.m
│   │   │   ├── lab02_random_matrix_and_submatrix_spy.m
│   │   │   ├── lab02_subplot_grid_plot_loop.m
│   │   │   ├── lab02_vector_addition_subtraction.m
│   │   │   ├── lab02_vector_euclidean_norm.m
│   │   │   ├── lab02_vector_transpose_multiplication.m
│   │   │   └── lab02_while_loop_linear_sequence.m
│   │   ├── lab03_transfer_functions_and_fractions
│   │   │   ├── lab03_partial_fraction_expansion_residue.m
│   │   │   ├── lab03_series_and_parallel_interconnections.m
│   │   │   ├── lab03_tf_to_zero_pole_gain_tf2zp.m
│   │   │   ├── lab03_transfer_function_definition_tf.m
│   │   │   └── lab03_zero_pole_gain_to_tf_zpk.m
│   │   ├── lab04_state_space_and_ode45_simulation
│   │   │   ├── part1_second_order_system
│   │   │   │   ├── ode_second_order_system.m
│   │   │   │   └── simulate_second_order_ode45.m
│   │   │   ├── part2_state_feedback_system
│   │   │   │   ├── ode_state_feedback_system.m
│   │   │   │   └── simulate_state_feedback_ode45.m
│   │   │   ├── part3_ode45_documentation
│   │   │   │   └── ode45_documentation_help.m
│   │   │   └── part4_unicycle_robot_kinematics
│   │   │       ├── ode_unicycle_robot_kinematics.m
│   │   │       └── simulate_unicycle_robot_ode45.m
│   │   ├── lab05_first_order_step_response
│   │   │   └── lab05_step_response_varying_time_constants.m
│   │   ├── lab06_simulink_block_diagram_simulation
│   │   │   ├── lab06_control_system_block_model.slx
│   │   │   └── lab06_second_order_system_parameters.m
│   │   ├── lab07_root_locus_stability_analysis
│   │   │   ├── lab07_closed_loop_step_stabilization_k2.m
│   │   │   ├── lab07_fourth_order_system_root_locus.m
│   │   │   ├── lab07_gain_variation_stability_comparison.m
│   │   │   ├── lab07_root_locus_complex_zeros_system.m
│   │   │   ├── lab07_root_locus_evaluation_script.m
│   │   │   ├── lab07_root_locus_factored_poles_zeros.m
│   │   │   ├── lab07_root_locus_open_loop_rhp_pole.m
│   │   │   ├── lab07_root_locus_third_order_open_loop.m
│   │   │   └── lab07_step_response_tuned_gain_k860.m
│   │   ├── lab08_bode_frequency_response
│   │   │   ├── lab08_bode_gain_and_phase_margins.m
│   │   │   └── lab08_bode_plot_first_order_zero.m
│   │   ├── lab09_nyquist_stability_criterion
│   │   │   ├── lab09_nyquist_closed_loop_verification.slx
│   │   │   ├── lab09_nyquist_fourth_order_system.m
│   │   │   ├── lab09_nyquist_standard_second_order.m
│   │   │   ├── lab09_nyquist_type1_second_order.m
│   │   │   └── lab09_nyquist_unstable_pole_system.m
│   │   └── robotics_and_manipulators_projects
│   │       ├── archive_variants
│   │       │   └── mobile_manipulator_variant.slx
│   │       ├── mobile_manipulator_simulink_model.slx
│   │       ├── mobile_manipulator_task_space_pid.m
│   │       ├── planar_2d_mobile_manipulator_kinematics.m
│   │       ├── six_dof_robotic_arm_kinematics.m
│   │       ├── spatial_3d_mobile_manipulator_kinematics.m
│   │       ├── wheeled_robot_pid_position_control.m
│   │       └── wheeled_robot_trajectory_tracking.m
│   └── microcontrollers_8051_assembly
│       ├── lab01_8051_all_led_blink.asm
│       ├── lab02_8051_single_led_blink.asm
│       ├── lab03_8051_running_led_chaser.asm
│       ├── lab04_8051_port_pin_led_toggle.asm
│       ├── lab05_8051_7segment_counter_0_to_9.asm
│       ├── lab06_8051_switch_to_7segment_display.asm
│       └── lab07_8051_matrix_keypad_7segment_decoder.asm
└── Semester_05_DSA_and_AI
    ├── README.md
    ├── applied_ai_and_machine_learning
    │   ├── aiml_coursework_assignment_problem_statement.pdf
    │   ├── data
    │   │   ├── A_winding_resistance.csv
    │   │   ├── A_winding_resistance_logger.csv
    │   │   ├── B_pv_plant.csv
    │   │   ├── C_feeder_load.csv
    │   │   ├── D_motor_thermal.csv
    │   │   ├── E_bearing_condition.csv
    │   │   └── F_pq_events.csv
    │   ├── exp01_winding_resistance_linear_regression.py
    │   ├── exp02_pv_plant_power_prediction_minibatch_gd.py
    │   ├── exp03_feeder_peak_load_polynomial_regression.py
    │   ├── exp04_motor_thermal_regularized_regression.py
    │   ├── exp05_bearing_vibration_fault_classification.py
    │   ├── exp06_power_quality_event_classification.py
    │   └── visualizations
    │       ├── B5_minibatch.png
    │       ├── C2_learning_curves.png
    │       ├── C4_extrapolation.png
    │       └── F1_regions.png
    ├── data_structures_and_algorithms_lab
    │   ├── lab01_recursion
    │   │   └── lab01_recursion_factorial_fibonacci_hanoi.py
    │   ├── lab02_arrays_searching_sorting
    │   │   ├── lab02_1d_array_crud_operations.py
    │   │   ├── lab02_array_reversal.py
    │   │   ├── lab02_linear_and_binary_search.py
    │   │   ├── lab02_matrix_multiplication_3x3.py
    │   │   └── sorting_algorithms
    │   │       ├── bubble_sort.py
    │   │       ├── insertion_sort.py
    │   │       └── selection_sort.py
    │   ├── lab03_linked_lists
    │   │   ├── lab03_doubly_linked_list_operations.py
    │   │   ├── lab03_polynomial_addition_linked_list.py
    │   │   ├── lab03_singly_linked_list_concatenate.py
    │   │   ├── lab03_singly_linked_list_filter_threshold.py
    │   │   ├── lab03_singly_linked_list_insert_delete.py
    │   │   ├── lab03_singly_linked_list_move_to_front.py
    │   │   └── lab03_singly_linked_list_sorted_operations.py
    │   └── linked_list_node_prototype.py
    └── theory_assignments
        ├── assignment_01_linked_lists_and_queues
        │   ├── circular_queue_array.py
        │   ├── nth_node_from_end_linked_list.py
        │   ├── queue_using_linked_list.py
        │   └── stack_using_linked_list.py
        ├── dsa_mid_sem_syllabus_notes.txt
        └── dsa_theory_assignment.docx
```

---

## Semester-Wise Code Index

### Semester 1: C Programming Laboratory (`Semester_01_C_Programming`)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `lab01_student_info_display.c` | C (GCC) | Standard I/O, format specifiers | Displays student profile including name, roll number, and subject |
| `lab01_data_types_io.c` | C (GCC) | Data types (`int`, `float`, `double`) | Reads and prints fundamental primitive data types from user input |
| `lab01_user_profile_scanner.c` | C (GCC) | String input, character buffers | Scans user first name, last name, and year of birth |
| `lab01_add_two_numbers.c` | C (GCC) | Arithmetic operators, `scanf` | Takes two integers and outputs their sum |
| `lab01_arithmetic_operations.c` | C (GCC) | Arithmetic (`+`, `-`, `*`, `/`) | Performs basic arithmetic operations on floating point numbers |
| `lab01_even_odd_checker.c` | C (GCC) | Modulo operator, conditional logic | Determines whether an integer is even or odd |
| `lab01_celsius_to_fahrenheit.c` | C (GCC) | Temperature conversion formula | Converts temperatures from Celsius to Fahrenheit scale |
| `lab01_rectangle_perimeter.c` | C (GCC) | Geometric formulas | Calculates the perimeter of a rectangle given height and width |
| `lab01_time_hours_to_minutes.c` | C (GCC) | Unit conversion | Converts input hours and minutes into total elapsed minutes |
| `lab02_check_numbers_equal.c` | C (GCC) | Relational operators | Checks whether two user-supplied integers are identical |
| `lab02_positive_negative_checker.c` | C (GCC) | Nested conditionals | Classifies an entered number as positive, negative, or zero |
| `lab02_largest_of_three_numbers.c` | C (GCC) | Logical AND (`&&`), branching | Identifies the greatest among three integers |
| `lab02_quadratic_equation_roots.c` | C (GCC) | `math.h`, discriminant analysis | Solves quadratic equations ax^2 + bx + c = 0 for real/complex roots |
| `lab02_loop_forward_reverse_count.c` | C (GCC) | For/While iteration loops | Counts sequentially forward (0 to 10) and backward (10 to 0) |
| `lab02_sum_until_zero_sentinel.c` | C (GCC) | Sentinel loop control | Sums user inputs continuously until sentinel value 0 is supplied |
| `lab02_day_of_week_switch.c` | C (GCC) | Switch-case statement | Maps numeric day index (1-7) to corresponding day of week |
| `lab02_first_10_natural_numbers.c` | C (GCC) | Loop accumulators | Prints and iterates through the first 10 positive natural numbers |
| `lab03_function_addition.c` | C (GCC) | Modular functions | Defines and executes an addition function with global variables |
| `lab03_function_subtraction.c` | C (GCC) | Function scope, returns | Calculates difference of two variables via dedicated function |
| `lab03_function_multiplication_params.c` | C (GCC) | Call-by-value parameters | Multiplies two integers passed as function arguments |
| `lab03_circle_properties.c` | C (GCC) | Macro definitions (`#define`) | Computes diameter, circumference, and area of a circle |
| `lab03_prime_number_checker.c` | C (GCC) | Primality testing, early exit | Validates whether an integer is prime using trial division |
| `lab03_binary_line_pattern.c` | C (GCC) | Nested loops, pattern printing | Generates alternating binary rows of ones and zeros |
| `lab04_1d_array_io.c` | C (GCC) | 1D array declaration & indexing | Reads elements into a fixed-size integer array and prints them |
| `lab04_negative_elements_filter.c` | C (GCC) | Array filtering, conditional loops | Scans an array and outputs only the negative values |
| `lab04_array_copy.c` | C (GCC) | Buffer copying, linear iteration | Copies all elements from a source array into a destination array |
| `lab04_count_duplicates.c` | C (GCC) | Nested array scanning | Identifies and counts duplicate elements inside an array |
| `lab04_matrix_linear_combination.c` | C (GCC) | 2D matrices, linear algebra | Computes matrix linear combination E = 2A + 3B |
| `lab05_pointer_address_and_dereference.c` | C (GCC) | Pointers, address-of (`&`), dereference (`*`) | Demonstrates memory addresses and value inspection across datatypes |
| `lab05_pointer_addition.c` | C (GCC) | Pointer dereferencing | Performs integer addition by dereferencing integer pointer variables |
| `lab05_pointer_arithmetic_operations.c` | C (GCC) | Pointer arithmetic | Performs four arithmetic operations using float pointer references |
| `lab05_array_sum_by_function_pointer.c` | C (GCC) | Passing arrays to functions | Computes sum of array elements through functional parameter passing |
| `lab05_pointer_reassignment.c` | C (GCC) | Pointer aliasing & reassignment | Tests pointer reassignment and indirect value manipulation |
| `lab06_string_length.c` | C (GCC) | `fgets`, string termination (`\0`) | Computes string length safely without buffer overflow |
| `lab06_string_copy.c` | C (GCC) | `strcpy`, string manipulation | Copies character string from source buffer to target buffer |
| `lab06_string_concatenation.c` | C (GCC) | `strcat`, null terminators | Concatenates two character arrays into a single string |
| `lab06_string_reversal.c` | C (GCC) | String indexing, reversers | Reverses a character array in-place and prints reverse order |
| `lab06_count_alphabets_digits_specials.c` | C (GCC) | Character classification (ASCII) | Counts alphabetic characters, digits, and special symbols in string |
| `lab07_student_structure_average.c` | C (GCC) | `struct`, record management | Defines student record (`name`, `age`, `marks`) and computes averages |
| `lab07_book_structure_max_price.c` | C (GCC) | Array of structures | Stores book metadata (`title`, `author`, `price`) and finds maximum price |
| `lab08_file_write_read_putw_getw.c` | C (GCC) | File streams, `putw`, `getw` | Writes integer binary data to file and reads it back |
| `lab08_file_read_fscanf.c` | C (GCC) | Formatted file I/O (`fscanf`) | Reads formatted integer data from file and displays to `stdout` |
| `lab08_file_library_records.c` | C (GCC) | File persistence, batch records | Reads and writes multi-record book inventory data to file storage |

---

### Semester 2: Python Programming Laboratory (`Semester_02_Python_Programming`)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `lab01_print_formatting_and_variables.py` | Python 3 | `print()` syntax, variable types | Demonstrates formatted output, string interpolation, and variables |
| `lab01_geometry_area_and_perimeter.py` | Python 3 | Geometric calculations, `math` | Calculates area and perimeter for rectangles, squares, and triangles |
| `lab01_multiline_string_and_comments.py` | Python 3 | Triple quotes, docstrings | Explores multiline strings, formatting, and comment paradigms |
| `lab01_time_converter_hours_to_seconds.py` | Python 3 | Arithmetic operations, I/O | Converts hours and minutes into total seconds |
| `lab01_celsius_to_fahrenheit.py` | Python 3 | Unit conversion | Converts temperature from Celsius to Fahrenheit scale |
| `lab01_math_sqrt_and_power.py` | Python 3 | `math.sqrt`, `pow`, exponentiation | Computes square root and exponentiation using `math` functions |
| `lab01_complex_number_arithmetic.py` | Python 3 | `complex` data type | Performs addition, subtraction, and multiplication on complex numbers |
| `lab01_factorial_calculation.py` | Python 3 | Iteration, `math.factorial` | Computes factorial of positive integers |
| `lab01_list_operations_basics.py` | Python 3 | Python `list`, append, insert | Basic list operations, searching, and item modification |
| `lab01_math_exp_and_gcd.py` | Python 3 | `math.exp`, `math.gcd` | Evaluates e^3 and greatest common divisor of integer pairs |
| `lab02_sign_checker_pos_neg_zero.py` | Python 3 | `if`-`elif`-`else` branching | Classifies input number as positive, negative, or zero |
| `lab02_even_odd_checker.py` | Python 3 | Modulo `%` operator | Tests whether a given integer is even or odd |
| `lab02_prime_checker.py` | Python 3 | Primality test, loop break | Checks if a number has prime factors using iteration |
| `lab02_multiplication_table.py` | Python 3 | `for` loop, formatted output | Prints complete multiplication table up to 10 for any integer |
| `lab02_quadratic_roots_calculator.py` | Python 3 | Discriminant b^2 - 4ac | Solves roots of quadratic equations with real/imaginary checks |
| `lab02_factorial_fraction_series_sum.py` | Python 3 | Series summation, `math.factorial` | Calculates sum of series sum(k / k!) for k=1 to n |
| `lab02_password_update_loop.py` | Python 3 | `while` loop, input verification | Simulates account password update with confirmation loop |
| `lab02_function_eval_fx.py` | Python 3 | Piecewise functions, evaluation | Evaluates mathematical function f(x) across given inputs |
| `lab02_bmi_calculator.py` | Python 3 | Arithmetic formulas, categories | Computes Body Mass Index (BMI) and health category |
| `lab02_for_loop_natural_numbers.py` | Python 3 | `range()`, sequential traversal | Generates first 10 natural numbers using `range(10)` |
| `lab02_even_numbers_in_range.py` | Python 3 | `range(start, stop, step)` | Filters and displays all even integers within a user-specified bound |
| `lab02_sum_range_numbers.py` | Python 3 | Accumulator variables | Computes cumulative sum of numbers within range (1, N) |
| `lab02_list_input_and_iteration.py` | Python 3 | Dynamic list ingestion | Prompts user for list size, collects elements, and traverses list |
| `lab02_count_letters_digits_specials.py` | Python 3 | String character classification | Counts letters, numeric digits, and special characters in input string |
| `lab02_while_loop_natural_numbers.py` | Python 3 | `while` loop, condition checks | Prints natural numbers using explicit while loop counter |
| `lab02_password_authentication_system.py` | Python 3 | Dictionary lookups, authentication | Simulates multi-user login with dictionary credentials authentication |
| `lab02_sentinel_infinite_while_loop.py` | Python 3 | Infinite loop, `break` keyword | Demonstrates infinite `while True` loop terminating on sentinel 0 |
| `lab03_list_color_manipulations.py` | Python 3 | List slicing, insert, remove | Exercises core methods (`pop`, `append`, `insert`) on color list |
| `lab03_split_list_into_halves.py` | Python 3 | Slice syntax `[:n]`, `[n:]` | Splits an arbitrary list cleanly into two equal halves |
| `lab03_filter_divisible_by_three.py` | Python 3 | List comprehension / filtering | Extracts numbers divisible by 3 from sequence 1 to 50 |
| `lab03_even_numbers_1_to_1000.py` | Python 3 | List generation | Populates list of all even integers between 1 and 1000 |
| `lab03_numerical_sum_and_mean_isinstance.py` | Python 3 | `isinstance()`, type checking | Extracts numeric types from heterogeneous list and calculates mean |
| `lab03_second_largest_using_set.py` | Python 3 | `set()`, uniqueness, sorting | Finds second-largest unique number in a list via set conversion |
| `lab03_count_positives_negatives_in_list.py` | Python 3 | Multi-variable accumulation | Counts positive, negative, and zero elements in list |
| `lab03_nested_sublist_extend.py` | Python 3 | Nested lists, `append()` | Appends and nests sublists within multi-dimensional lists |
| `lab03_mixed_datatype_tuple.py` | Python 3 | `tuple` immutability | Creates and accesses heterogeneous tuple of string, bool, float, int |
| `lab03_tuple_functions_min_max_len_count.py` | Python 3 | Built-in tuple utilities | Demonstrates `min()`, `max()`, `len()`, and `count()` on tuples |
| `lab03_tuple_min_max_search.py` | Python 3 | Search algorithms | Finds extreme elements in numeric tuples |
| `lab03_list_of_tuples_number_and_cube.py` | Python 3 | Tuple creation, mapping | Maps list of integers [n] to list of tuples [(n, n^3)] |
| `lab03_set_creation_and_modification.py` | Python 3 | `set` operations, `add()` | Initializes set with mixed types and mutates with `add()` |
| `lab03_set_union_and_intersection.py` | Python 3 | Set algebra (Union, Intersection) | Performs union (A | B) and intersection (A & B) operations |
| `lab03_semester_subjects_dictionary.py` | Python 3 | Key-value mappings, `dict` | Maps subject codes to names and exercises dictionary CRUD operations |
| `lab03_dictionary_length_inspection.py` | Python 3 | `len()` on dictionaries | Computes number of active key-value pairs in dictionary |
| `lab03_dictionary_key_membership_checker.py` | Python 3 | `in` / `not in` operators | Tests key existence in dictionary using membership operators |
| `lab03_dictionary_builtin_functions_demo.py` | Python 3 | `keys()`, `values()`, `items()` | Explores dictionary views and mutation functions |
| `lab04_string_first_and_last_char.py` | Python 3 | String indexing `[0]`, `[-1]` | Extracts and displays first and last characters of a string |
| `lab04_string_length.py` | Python 3 | `len()` for strings | Calculates total character length of string buffer |
| `lab04_string_equality_comparison.py` | Python 3 | Lexicographical comparison | Compares two strings for exact equality |
| `lab04_string_concatenation_join.py` | Python 3 | String concatenation | Joins multiple strings using concatenation and formatting |
| `lab04_vowel_checker.py` | Python 3 | Character membership | Checks whether an entered character is an English vowel |
| `lab04_string_character_deletion_slicing.py` | Python 3 | Slice deletion | Removes specific indexed characters (3rd and penultimate) from string |
| `lab04_character_search_and_split.py` | Python 3 | `split()`, substring search | Splits sentence into individual word tokens and verifies character presence |
| `lab04_string_rotation_left_right.py` | Python 3 | String slicing, cyclical shift | Performs cyclical string rotation left and right by d elements |
| `lab04_sentence_case_and_word_count.py` | Python 3 | `upper()`, whitespace analysis | Converts sentence to uppercase, counts words and total characters |
| `lab04_function_cube_of_number.py` | Python 3 | Function definition `def` | Computes cube of a number via pure function |
| `lab04_function_circle_geometry.py` | Python 3 | Multiple return values | Function computing circle diameter, circumference, and area |
| `lab04_function_max_of_three.py` | Python 3 | Function arguments | Returns the maximum of three numbers passed into function |
| `lab04_function_even_odd_checker.py` | Python 3 | Boolean function return | Checks even/odd parity using modular functional design |
| `lab04_function_prime_and_armstrong.py` | Python 3 | Number theory algorithms | Tests whether a number is Prime or an Armstrong number |
| `lab04_function_power_calculation.py` | Python 3 | Exponentiation functions | Computes x^y through user-defined function |
| `lab04_function_print_natural_numbers.py` | Python 3 | Functional iteration | Prints sequence of natural numbers up to N |
| `lab04_function_palindrome_checker.py` | Python 3 | Slicing `[::-1]`, recursion | Checks whether integer or string input is a Palindrome |
| `lab04_function_factorial.py` | Python 3 | Factorial function | Calculates factorial recursively or iteratively |
| `lab04_lambda_filter_divisible_by_11.py` | Python 3 | `lambda`, `filter()` | Filters numbers divisible by 11 between 200 and 500 |

---

### Semester 3: Numerical Methods & Scientific Computing (`Semester_03_Numerical_Methods_MATLAB`)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `exp01_three_variable_arithmetic.m` | MATLAB | Variable arithmetic | Basic variable initialization and arithmetic operations in MATLAB |
| `exp02_matrix_arithmetic_and_manipulation.m` | MATLAB | Matrix algebra | Matrix operations, transposition, multiplication, and inverses |
| `exp03_quadratic_roots.m` | MATLAB | `roots()` function | Evaluates roots of polynomial quadratic equations |
| `exp03_nonlinear_roots.m` | MATLAB | Non-linear equations | Finds roots of non-linear functions using numerical evaluation |
| `exp03_hypotenuse_calculator.m` | MATLAB | Pythagoras theorem | Computes hypotenuse given orthogonal triangle dimensions |
| `exp03_cone_surface_area_and_volume.m` | MATLAB | Cone geometry formulas | Calculates slant height, surface area, and volume of right cone |
| `exp03_compound_interest_calculation.m` | MATLAB | Exponential growth formulas | Computes compound interest accrued over variable investment periods |
| `exp03_linear_system_solver_3x3.m` | MATLAB | Matrix inversion / `linsolve` | Solves system of 3 simultaneous linear equations in 3 variables |
| `exp03_cone_geometry_analysis.m` | MATLAB | Cone surface analysis | Evaluates total geometric parameters of conical solids |
| `exp04_sum_first_20_natural_numbers.m` | MATLAB | Loop accumulator | Sums the first 20 natural integers using a for loop |
| `exp04_factorial_calculator.m` | MATLAB | Factorial evaluation | Compares manual loop factorial with MATLAB `factorial()` |
| `exp04_compound_growth_years_target.m` | MATLAB | While loop convergence | Calculates elapsed years required for capital to reach target sum |
| `exp04_cramers_rule_linear_solver.m` | MATLAB | Cramer rule, determinants | Solves linear equation systems via determinant ratios (Dx / D) |
| `exp04_student_grade_evaluator.m` | MATLAB | Decision branching | Maps numeric exam scores to standardized university letter grades |
| `exp04_even_odd_checker.m` | MATLAB | Modulo `mod()` | Tests integer parity using MATLAB `mod(x, 2)` |
| `exp04_prime_number_checker.m` | MATLAB | Primality verification | Validates prime numbers with trial division and loop termination |
| `exp05_linear_plot_mx_plus_c.m` | MATLAB | 2D line plotting (`plot`) | Plots linear equation y = mx + c with customized axes and labels |
| `exp05_power_function_plots.m` | MATLAB | Vectorized power curves | Plots power functions y = x^n with hold-on overlays |
| `exp05_trigonometric_plots.m` | MATLAB | Sine & cosine curves | Plots trigonometric functions across degree angles (0 to 360 deg) |
| `exp05_3d_surface_plot_linear.m` | MATLAB | `plot3` 3D trajectory | Plots 3-dimensional trajectory Z = x/2 + y |
| `exp05_3d_trigonometric_trajectory.m` | MATLAB | 3D parametric curves | Generates helical 3D trigonometric trajectory over [0, 10*pi] |
| `exp05_meshgrid_surface_plot.m` | MATLAB | `meshgrid`, `surf`, `mesh` | Generates 3D surface visualizations across 2D coordinate grid |
| `exp05_assignment_radial_surface_plot.m` | MATLAB | Radial surface functions | Plots inverse radial surface z = 1/(15(X^2 + Y^2)) |
| `exp06_bisection_polynomial_quadratic.m` | MATLAB | Bisection method | Finds real root of quadratic y(x) = 2x^2 - 9x + 4 using Bisection |
| `exp06_bisection_polynomial_cubic.m` | MATLAB | Bisection method | Finds real root of cubic polynomial y(x) = x^3 + 3x + 1 |
| `exp06_bisection_transcendental_exp.m` | MATLAB | Bisection method | Finds root of transcendental function y(x) = exp(2x) - x - 6 |
| `exp07_newton_raphson_manual_derivative.m` | MATLAB | Newton-Raphson method | Finds root with manual derivative function handle x_{n+1} = x_n - f/f' |
| `exp07_secant_method_cubic_root.m` | MATLAB | Secant method | Iterates Secant method using two previous guesses to find cubic root |
| `exp07_newton_raphson_symbolic_derivative.m` | MATLAB | Symbolic diff (`syms`, `diff`) | Automatically differentiates symbolic expression to run Newton-Raphson |
| `exp08_euler_ode_initial_value_problem.m` | MATLAB | Euler method for ODEs | Solves initial value ODE dy/dx = f(x, y) using explicit Euler method |
| `exp09_trapezoidal_rule_sin_x.m` | MATLAB | Trapezoidal integration | Computes area under f(x) = sin(x) over [0, pi/2] with n=10 intervals |
| `exp09_trapezoidal_rule_x_sin_x.m` | MATLAB | Trapezoidal integration | Computes numerical integral of f(x) = x*sin(x) over [0, pi/2] |
| `exp09_trapezoidal_rule_x_squared.m` | MATLAB | Trapezoidal integration | Integrates f(x) = x^2 over [1, 3] with n=5 subintervals |
| `exp10_simpsons_one_third_rule_rational.m` | MATLAB | Simpson 1/3 Rule | Integrates rational function f(x) = 1/(1+x^2) over [0, 1] |
| `exp10_simpsons_three_eighth_rule_linear.m` | MATLAB | Simpson 3/8 Rule | Evaluates numerical integral of linear function using 3/8 rule |
| `electrical_network_simulation.slx` | Simulink | Circuit block modeling | Simulink block diagram model simulating dynamic electrical network |
| `traffic_density_ode_numerical_solutions.m` | MATLAB | Multi-method ODE comparison | Solves traffic density ODE with analytical, Euler, and RK methods |
| `psim_power_systems_simulation.slx` | Simulink | Power systems simulation | Simulink model for power electronics and system simulation |
| `bisection_auto_interval_finder.m` | MATLAB | Automated interval scanning | Scans range for sign-change brackets before executing Bisection |

---

### Semester 4: Embedded Systems & Control Systems (`Semester_04_Control_and_Embedded_Systems`)

#### Part A: Microcontrollers & Embedded Systems (Intel 8051 Assembly)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `lab01_8051_all_led_blink.asm` | 8051 ASM / Keil | Port I/O (`P1`), delay loop | Toggles all 8 LEDs connected to Port 1 between `0x00` and `0xFF` |
| `lab02_8051_single_led_blink.asm` | 8051 ASM / Keil | Bitwise port output | Blinks single LED on pin P1.0 (`0xFE` vs `0xFF`) with software delay |
| `lab03_8051_running_led_chaser.asm` | 8051 ASM / Keil | Rotate accumulator (`RL A`) | Implements continuous running LED chaser / ring counter on Port 1 |
| `lab04_8051_port_pin_led_toggle.asm` | 8051 ASM / Keil | Control lines (`P3.3`, `P3.4`) | Drives Port 1 LEDs while setting hardware control/enable lines |
| `lab05_8051_7segment_counter_0_to_9.asm` | 8051 ASM / Keil | Common-anode 7-segment | Cycles decimal digits 0 to 9 on 7-segment display via hex lookups |
| `lab06_8051_switch_to_7segment_display.asm` | 8051 ASM / Keil | Switch input (`P2`), branching | Reads push-button input lines on Port 2 and decodes to 7-segment digit |
| `lab07_8051_matrix_keypad_7segment_decoder.asm` | 8051 ASM / Keil | 4x3 matrix keypad scanning | Scans matrix keypad row-by-row, detects keypress, and displays on 7-segment |

#### Part B: Linear Control Systems & Robotics Simulation (MATLAB / Simulink)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `lab01_linear_ramp_plot.m` | MATLAB | Signal generation | Generates and plots linear ramp input signals Y = 4X |
| `lab01_subplot_signals_comparison.m` | MATLAB | `subplot(2,2,k)` grid | Plots 4 signal transformations (2y, x-2, x^2, 4x) in 2x2 grid |
| `lab01_matrix_nested_loop_generator.m` | MATLAB | Matrix indexing | Generates a 50x50 numerical grid matrix using nested for loops |
| `lab02_vector_addition_subtraction.m` | MATLAB | Vector operations | Performs vector addition and element-wise arithmetic |
| `lab02_vector_euclidean_norm.m` | MATLAB | Euclidean L2 norm | Computes vector norm ||a||_2 = sqrt(sum(a_i^2)) |
| `lab02_vector_transpose_multiplication.m` | MATLAB | Inner & outer products | Computes vector transposition, inner product, and outer product matrix |
| `lab02_block_matrix_eye_zeros_ones_diag.m` | MATLAB | `eye`, `zeros`, `ones`, `diag` | Constructs composite block matrices from fundamental matrix blocks |
| `lab02_random_matrix_and_submatrix_spy.m` | MATLAB | `rand`, submatrix, `spy` | Generates random matrix, extracts submatrices, and plots sparsity |
| `lab03_partial_fraction_expansion_residue.m` | MATLAB | `residue()` function | Converts continuous polynomial fraction to partial fraction residues & poles |
| `lab03_tf_to_zero_pole_gain_tf2zp.m` | MATLAB | `tf2zp()` | Converts polynomial transfer function coefficients to zero-pole-gain format |
| `lab03_transfer_function_definition_tf.m` | MATLAB | `tf()` object | Defines continuous-time transfer function G(s) = N(s) / D(s) |
| `lab03_zero_pole_gain_to_tf_zpk.m` | MATLAB | `zpk()` function | Creates zero-pole-gain system and extracts transfer function |
| `lab03_series_and_parallel_interconnections.m` | MATLAB | `series()`, `parallel()` | Computes equivalent transfer functions for series/parallel block cascades |
| `ode_second_order_system.m` | MATLAB | State derivatives | Defines second-order state derivatives dx_1 = x_2, dx_2 = x_2 + 5 |
| `simulate_second_order_ode45.m` | MATLAB | `ode45` numerical integration | Simulates second-order dynamical system trajectories over time |
| `ode_state_feedback_system.m` | MATLAB | Linear state feedback | Implements 3-state system with linear state feedback control law u = Kx |
| `simulate_state_feedback_ode45.m` | MATLAB | Closed-loop state simulation | Numerically integrates closed-loop state feedback response via `ode45` |
| `ode_unicycle_robot_kinematics.m` | MATLAB | Non-holonomic unicycle kinematics | Defines mobile robot kinematic differential equations [dx, dy, dtheta] |
| `simulate_unicycle_robot_ode45.m` | MATLAB | Robot trajectory simulation | Integrates unicycle kinematics under constant velocities to plot path |
| `lab05_step_response_varying_time_constants.m` | MATLAB | First-order step response | Analyzes transient response of G(s) = 1/(tau*s + 1) across varying time constants |
| `lab06_second_order_system_parameters.m` | MATLAB | Simulink parameter loading | Initializes second-order plant parameters for Simulink feedback loops |
| `lab06_control_system_block_model.slx` | Simulink | Feedback loop simulation | Closed-loop Simulink block model with step input and scope visualization |
| `lab07_root_locus_third_order_open_loop.m` | MATLAB | `rlocus()` stability analysis | Plots root locus for 3rd order open-loop plant G(s) = 1/(s(s+7)(s+11)) |
| `lab07_step_response_tuned_gain_k860.m` | MATLAB | `step(feedback(K*G, 1))` | Simulates closed-loop transient response for tuned gain K = 860 |
| `lab07_root_locus_open_loop_rhp_pole.m` | MATLAB | Right-half-plane pole system | Analyzes root locus of open-loop unstable system G(s) = (s+1)/(s(0.1s-1)) |
| `lab07_closed_loop_step_stabilization_k2.m` | MATLAB | Feedback stabilization | Demonstrates closed-loop stabilization of open-loop unstable plant using K=2 |
| `lab07_gain_variation_stability_comparison.m` | MATLAB | Marginal stability testing | Compares stable, marginally stable, and unstable closed-loop step responses |
| `lab08_bode_plot_first_order_zero.m` | MATLAB | Frequency response | Generates Bode magnitude and phase diagrams for lead zero system (s+1) |
| `lab08_bode_gain_and_phase_margins.m` | MATLAB | `margin()` analysis | Computes Gain Margin, Phase Margin, gain and phase crossover frequencies |
| `lab09_nyquist_unstable_pole_system.m` | MATLAB | `nyquist()` stability | Plots Nyquist polar diagram and evaluates encirclements of (-1, j0) |
| `planar_2d_mobile_manipulator_kinematics.m` | MATLAB | Planar robotics kinematics | Simulates forward and inverse kinematics of 2D wheeled mobile robot arm |
| `spatial_3d_mobile_manipulator_kinematics.m` | MATLAB | 3D robotic arm kinematics | 3D kinematics model for multi-link arm mounted on differential drive base |
| `wheeled_robot_trajectory_tracking.m` | MATLAB | Trajectory tracking | Simulates wheeled robot tracking circular and sinusoidal trajectory paths |
| `six_dof_robotic_arm_kinematics.m` | MATLAB | 6-DOF manipulator | Full 6-degree-of-freedom robotic manipulator kinematic simulation |
| `mobile_manipulator_task_space_pid.m` | MATLAB | Task-space PID controller | Closed-loop PID controller driving mobile manipulator end-effector to target |

---

### Semester 5: Data Structures, Algorithms & Applied AI / ML (`Semester_05_DSA_and_AI`)

#### Part A: Applied AI & Machine Learning (`applied_ai_and_machine_learning`)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `exp01_winding_resistance_linear_regression.py` | Python 3 / Scikit-Learn | OLS & Huber robust regression | Predicts electrical motor winding resistance vs temperature with outlier handling |
| `exp02_pv_plant_power_prediction_minibatch_gd.py` | Python 3 / NumPy | Mini-batch Gradient Descent | Predicts PV plant AC power output from solar irradiance and panel temperature |
| `exp03_feeder_peak_load_polynomial_regression.py` | Python 3 / Scikit-Learn | Polynomial features, learning curves | Forecasts electrical grid feeder peak load and diagnoses bias vs variance |
| `exp04_motor_thermal_regularized_regression.py` | Python 3 / Scikit-Learn | Ridge (L2) & Lasso (L1) regularization | Predicts motor thermal rise across current frequency bands using cross-validation |
| `exp05_bearing_vibration_fault_classification.py` | Python 3 / Scikit-Learn | Binary Logistic Regression | Classifies healthy vs faulty industrial bearings from vibration RMS and kurtosis |
| `exp06_power_quality_event_classification.py` | Python 3 / Scikit-Learn | Multiclass Logistic Regression | Classifies power quality events (voltage sag, harmonics, interruption) |

#### Part B: Data Structures & Algorithms (`data_structures_and_algorithms_lab` & `theory_assignments`)

| Lab / File Name | Language / Target | Core Concepts Covered | Description of Functionality |
|:---|:---|:---|:---|
| `lab01_recursion_factorial_fibonacci_hanoi.py` | Python 3 | Direct/indirect recursion | Implements factorial, Fibonacci sequence, and Tower of Hanoi puzzle solver |
| `lab02_1d_array_crud_operations.py` | Python 3 | Linear array algorithms | Implements array creation, element insertion, deletion, searching, and traversal |
| `lab02_array_reversal.py` | Python 3 | In-place two-pointer reversal | Reverses an integer array using two-pointer swap in O(N) time |
| `lab02_matrix_multiplication_3x3.py` | Python 3 | Matrix multiplication | Multiplies two 3x3 matrices using nested three-level loops in O(N^3) time |
| `lab02_linear_and_binary_search.py` | Python 3 | Search algorithms | Implements Linear Search (O(N)) and Binary Search (O(log N)) on sorted data |
| `bubble_sort.py` | Python 3 | Bubble sort algorithm | Sorts array elements via repeated adjacent swaps with early termination |
| `insertion_sort.py` | Python 3 | Insertion sort algorithm | Inserts elements into their correct sorted position iteratively |
| `selection_sort.py` | Python 3 | Selection sort algorithm | Finds minimum element from unsorted partition and places it at beginning |
| `lab03_singly_linked_list_insert_delete.py` | Python 3 | Singly Linked List (SLL) | SLL node insertion (head, tail, middle) and deletion (head, tail, middle) |
| `lab03_singly_linked_list_sorted_operations.py` | Python 3 | Ordered insertion in SLL | Inserts nodes in sorted order, searches key, and deletes by target value |
| `lab03_singly_linked_list_concatenate.py` | Python 3 | Linked list merging | Concatenates two distinct singly linked lists into a single continuous chain |
| `lab03_singly_linked_list_move_to_front.py` | Python 3 | Pointer manipulation | Detaches target node by value and moves it to head of singly linked list |
| `lab03_polynomial_addition_linked_list.py` | Python 3 | Polynomial representations | Represents polynomials (c * x^e) as linked list nodes and computes their sum |
| `lab03_doubly_linked_list_operations.py` | Python 3 | Doubly Linked List (DLL) | Implements two-way pointer links (`prev`, `next`), front/end insertion and deletion |
| `lab03_singly_linked_list_filter_threshold.py` | Python 3 | In-place list filtering | Deletes all nodes whose values are greater than or equal to a given threshold |
| `nth_node_from_end_linked_list.py` | Python 3 | Fast & slow two-pointer method | Finds N-th node from end of linked list in single pass without knowing length |
| `stack_using_linked_list.py` | Python 3 | LIFO Stack via linked list | Implements `push`, `pop`, `peek`, and `is_empty` stack methods using SLL |
| `queue_using_linked_list.py` | Python 3 | FIFO Queue via linked list | Implements `enqueue` at rear and `dequeue` from front with head/tail pointers |
| `circular_queue_array.py` | Python 3 | Circular Queue (Ring Buffer) | Implements fixed-size circular queue using modulo arithmetic (rear + 1) % size |

---

## How to Compile & Run

### 1. C Programs (GCC)
All C programs adhere to standard C99/C11 standards and can be compiled using `gcc`:
```bash
# Navigate to desired lab:
cd Semester_01_C_Programming/lab01_basics_and_io

# Compile with warnings enabled:
gcc -Wall -Wextra -O2 lab01_arithmetic_operations.c -o arithmetic_app -lm

# Execute:
./arithmetic_app
```

### 2. Python Scripts (Python 3)
Run any Python lab directly using Python 3:
```bash
# For Semester 2 fundamentals:
python3 Semester_02_Python_Programming/lab01_basics_and_data_types/lab01_math_exp_and_gcd.py

# For Semester 5 DSA labs:
python3 Semester_05_DSA_and_AI/data_structures_and_algorithms_lab/lab03_linked_lists/lab03_singly_linked_list_insert_delete.py

# For Applied AI / Machine Learning scripts (requires dependencies):
pip install numpy pandas scikit-learn matplotlib
cd Semester_05_DSA_and_AI/applied_ai_and_machine_learning
python3 exp01_winding_resistance_linear_regression.py
```

### 3. Embedded Systems (Intel 8051 Assembly)
The 8051 Assembly firmware files (`.asm`) located in `Semester_04_Control_and_Embedded_Systems/microcontrollers_8051_assembly/` can be compiled and simulated using:
- **Keil uVision (A51 Assembler):** Create an 8051 project (e.g., AT89C51 / AT89S52), add the `.asm` file, configure clock frequency (typically 11.0592 MHz or 12 MHz), and build the target `.hex` file.
- **MCU 8051 IDE / EdSim51:** Open the `.asm` script and step through registers, accumulator, and Port 1 / Port 2 / Port 3 virtual LEDs and 7-segment displays.
- **Proteus VSM Simulation:** Load the compiled `.hex` output into an AT89C51 schematic with animated LEDs, 7-segment displays, and a 4x3 keypad matrix.

### 4. MATLAB & Simulink
- **Numerical Methods & Control Systems:** Open MATLAB R2020b or newer, add the semester folder to your MATLAB path, and run the `.m` scripts.
- **Simulink Models (`.slx`):** Launch Simulink and open models such as `mobile_manipulator_simulink_model.slx` or `lab06_control_system_block_model.slx` directly from the MATLAB command window:
  ```matlab
  open("lab06_control_system_block_model.slx");
  sim("lab06_control_system_block_model.slx");
  ```

---

## License

This repository is licensed under the [MIT License](LICENSE).
