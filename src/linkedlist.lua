---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by alanp.
--- DateTime: 2019-05-09 오후 6:48
---
local linkedlist = {}

LinkedList = {head = nil, tail = nil, __index = {}}

LinkedListNode = {next = nil, data = nil, __index = {}}

function LinkedListNode:new(data)
    node = {}
    node.next = nil
    node.data = data
    setmetatable(node, self)
    self.__index = self
    return node
end

function LinkedList:new()
    list = {}
    list.head = nil
    list.tail = nil
    setmetatable(list, self)
    self.__index = self
    return list
end

function LinkedList:get_back()
    if self.tail == nil then return nil end
    return self.tail.data
end

function LinkedList:get_front()
    if self.head == nil then return nil end
    return self.head.data
end

function LinkedList:add_back(data)
    if self.tail == nil then
        self.tail = LinkedListNode:new(data)
        self.head = self.tail
        self.tail.next = nil
        return
    end
    self.tail.next = LinkedListNode:new(data)
    self.tail = self.tail.next
    self.tail.next = nil
end

function LinkedList:add_front(data)
    if self.head == nil then
        self.head = LinkedListNode:new(data)
        self.tail = self.head
        self.tail.next = nil
        return
    end
    node = LinkedListNode:new(data)
    node.next = self.head
    self.head = node
    self.tail.next = nil
end

function LinkedList:remove_front()
    if self.head == nil then
        return
    end
    if self.tail == self.head then
        self.head = nil
        self.tail = nil
        return
    end
    self.head = self.head.next
end

function LinkedList:remove_back()
    if self.head == nil then
        return
    end
    if self.tail == self.head then
        self.head = nil
        self.tail = nil
        return
    end
    node = self.head
    repeat
        node = node.next
    until node.next == self.tail
    self.tail = node
    self.tail.next = nil
end

function LinkedList:size()
    if self.head == nil then return 0 end
    count = 0
    node = self.head
    repeat
        count = count + 1
        node = node.next
    until node == nil

    return count
end
return LinkedList