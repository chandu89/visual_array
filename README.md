# VisualArray  
##  Description  

VisualArray is a Ruby gem that provides a structured and visually appealing way to display arrays and perform mathematical operations on them. It supports:

 - 1D, 2D, and Multi-Dimensional Arrays

 - Matrix Addition, Subtraction, Multiplication & Division

 - Customizable Color Display

 - Formatted Step-by-Step Calculation Outputs
## RubyGems  

The gem is available here  [VisualArrayGem](https://rubygems.org/gems/visual_array)  

---

## Installation  

Add this line to your application's Gemfile:  

```sh
bundle add visual_array
```

Or install it manually:  

```sh
gem install visual_array
```

---

## Usage  

### **1⃣ Displaying 1D Arrays**  

```ruby
require 'visual_array'

VisualArray.display([1, 2, 3, 4])
```

**Output:**  
```
+---+---+---+---+
| 1 | 2 | 3 | 4 |
+---+---+---+---+
```

---

### **2⃣ Displaying 2D Arrays**  

```ruby
VisualArray.display([
  [1, 2],
  [3, 4]
])
```

**Output:**  
```
+-----+-----+
|  1  |  2  |
|  3  |  4  |
+-----+-----+
```

---

### **3⃣ Displaying Multi-Dimensional Arrays**  

```ruby
VisualArray.display([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
```

**Output:**  
```
Dimension 1, Index 0:
+-----+-----+
|  1  |  2  |
|  3  |  4  |
+-----+-----+

Dimension 1, Index 1:
+-----+-----+
|  5  |  6  |
|  7  |  8  |
+-----+-----+
```

---

## **Mathematical Operations**  

### **4⃣ Matrix Addition**  

```ruby
matrix_a = [[1, 2], [3, 4]]
matrix_b = [[5, 6], [7, 8]]

VisualArray.add_and_display(matrix_a, matrix_b, color: 'green')
```

**Output:**  
```
Matrix Addition Result:
1 + 5 = 6   2 + 6 = 8
3 + 7 = 10  4 + 8 = 12
```

---

### **5⃣ Matrix Subtraction**  

```ruby
matrix_a = [[9, 8], [7, 6]]
matrix_b = [[5, 4], [3, 2]]

VisualArray.subtract_and_display(matrix_a, matrix_b, color: 'yellow')
```

**Output:**  
```
Matrix Subtraction Result:
9 - 5 = 4   8 - 4 = 4
7 - 3 = 4   6 - 2 = 4
```

---

### **6⃣ Matrix Multiplication**  

```ruby
matrix_a = [[1, 2], [3, 4]]
matrix_b = [[5, 6], [7, 8]]

VisualArray.multiply_and_display(matrix_a, matrix_b, color: 'red')
```

**Output:**  
```
Matrix Multiplication Result:
(1 * 5 + 2 * 7) = 19   (1 * 6 + 2 * 8) = 22
(3 * 5 + 4 * 7) = 43   (3 * 6 + 4 * 8) = 50
```

---

### **7⃣ Matrix Division**  

```ruby
matrix_a = [[10, 20], [30, 40]]
matrix_b = [[2, 4], [5, 10]]

VisualArray.divide_and_display(matrix_a, matrix_b, color: 'cyan')
```

**Output:**  
```
Matrix Division Result:
10 / 2 = 5   20 / 4 = 5
30 / 5 = 6   40 / 10 = 4
```

---

## Customizing Color  

You can pass an optional `color` parameter:  

```ruby
VisualArray.display(
  [[[1, 2], [3, 4]], [[5, 6], [7, 8]]],
  color: 'blue'
)
```

---

## Visual Representation  

<img width="952" alt="image" src="https://github.com/user-attachments/assets/d9f143af-4dd5-4908-abc0-58385ec4e873" />
<img width="942" alt="image" src="https://github.com/user-attachments/assets/14c0ba5c-412f-48bc-81e2-ad4cfdba349f" />


## Contributing  

Bug reports and pull requests are welcome at [GitHub](https://github.com/chandu89/visual_array).  

---

## 📝 License  

This project is available under the [MIT License](LICENSE.txt).  

