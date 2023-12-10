// MinStack - структура для реализации стека с поддержкой минимального элемента
type MinStack struct {
    top *StackNode // Указатель на вершину стека
    min int        // Текущее минимальное значение в стеке
}

// StackNode - структура для представления узла стека
type StackNode struct {
    data    int        // Значение узла (данные)
    next    *StackNode // Указатель на следующий узел в стеке
    lastmin int        // Последнее минимальное значение на момент добавления узла
}

// Создание экземпляра стека
var mystack MinStack = MinStack{top: nil}
var newtop *StackNode

// Constructor - конструктор для создания нового стека
func Constructor() MinStack {
    return mystack
}

// Push - добавляет новый элемент в стек
func (this *MinStack) Push(val int) {
    // Если стек пустой
    if this.top == nil {
        // Создаем новый узел с переданным значением и указываем на текущую вершину стека
        newtop = &StackNode{data: val, next: this.top}
        // Текущее минимальное значение в стеке устанавливаем равным значению нового узла
        this.min = val
    } else {
        // Если стек не пустой
        // Создаем новый узел с переданным значением, указываем на текущую вершину и сохраняем текущее минимальное значение
        newtop = &StackNode{data: val, next: this.top, lastmin: this.min}
    }
    // Обновление вершины стека
    this.top = newtop
    // Обновление текущего минимального значения, если новый элемент меньше текущего минимального значения
    if this.top.data < this.min {
        this.min = this.top.data
    }
}

// Pop - удаляет верхний элемент из стека
func (this *MinStack) Pop() {
    // Если следующий узел после вершины пуст, то стек становится пустым
    if this.top.next == nil {
        this.top = nil
        return
    }
    // Обновляем текущее минимальное значение до значения lastmin текущей вершины
    this.min = this.top.lastmin
    // Перемещаем указатель вершины на следующий узел, удаляя текущий верхний элемент
    *this.top = *this.top.next
}

// Top - возвращает значение верхнего элемента стека
func (this *MinStack) Top() int {
    return this.top.data
}

// GetMin - возвращает текущее минимальное значение в стеке
func (this *MinStack) GetMin() int {
    return this.min
}
