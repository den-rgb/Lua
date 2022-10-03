function max(a)
if #a==0 then return nil else
    local curr = -math.huge
    for _,v in ipairs(a) do
        if v>curr then curr=v end
    end
    return curr
end
end

function min(a)
if #a==0 then return nil else
    local curr = math.huge
    for _,v in ipairs(a) do
        if v<curr then curr=v end
    end
    return curr
end
end

function secondMax(a)
if #a==0 then return nil else
    local curr = -math.huge
    local sec = curr
    for _,v in ipairs(a) do
        if v>curr then curr=v end
            for _, k in ipairs(a) do
                if k>sec and k<curr then sec=k
                end
            end
    end 
    return sec
end
end

function secondMin(a)
if #a==0 then return nil else
    local curr = math.huge
    for _,v in ipairs(a) do
        if v<curr then curr=v end
            for _,k in ipairs(a) do
            if k<sec and k>curr then sec=k end
        end
    end
    return sec
    end
end

function whereIsMax(a)
    local curr = -math.huge
    maxloc = {}
    local index = max(a)
    for i=1,#a do
        if index == a[i] then
            table.insert(maxloc,i)
        end
    end
   return maxloc
end

function leftOfMax(a)
if #a==0 then return nil else
    local curr = -math.huge
    local index 
    for k,v in ipairs(a) do
        if v>curr then 
            curr=v 
            index = a[k-1]
        end
    end
    return index
end
end

function lenOfLongestIncreasingSubsequence(a)
if #a==0 then return nil else
    local curr = -math.huge
    local count = 0
    local seq = 0
    for _,v in ipairs(a) do
        if v>curr and v~=curr then
            count = count + 1
            curr=v
            if count>seq then
                seq=count
            end
        else 
            count = 1
            curr = v
        end
    end
    return seq
end
end

local test_1 = {
    a = {10, 34, 5, 15, 16, -20, -5},
    functions = {
    min = -20,
    max = 34,
    secondMax = 16,
    secondMin = -5,
    whereIsMax = {2},
    leftOfMax = 10,
    lenOfLongestIncreasingSubsequence = 3
    }
}

local test_2 = {
    a = {10,-5, 20, 20},
    functions = {
    min = -5,
    max = 20,
    secondMax = 10,
    secondMin = 10,
    whereIsMax = {3,4},
    leftOfMax = -5,
    lenOfLongestIncreasingSubsequence = 2
    }
}


local test_3 = {
    a = {},
    functions = {
    min = nil,
    max = nil,
    secondMax = nil,
    secondMin = nil,
    whereIsMax = {},
    leftOfMax = nil,
    lenOfLongestIncreasingSubsequence = nil
    }
}
local tests = {test_1=test_1, test_2=test_2, empty=test_3}

local functions = {'min','max','secondMax','whereIsMax','leftOfMax','lenOfLongestIncreasingSubsequence'}


for tstName, test in pairs(tests) do
    print("Test: " .. tstName)
    print("\t")
    print("Data: ".. table.concat(test.a,", "))

    for _,f in ipairs(functions) do
        print(f)
        local expected = test.functions[f]
        local observed = _G[f](test.a)

        if f=="whereIsMax" then
            expected = table.concat(expected,", ")
            observed = table.concat(observed,", ")
        end

        local result = (expected==observed) and "passed" or "***FAIL***"
        print(string.format("function = %s \t expected = %5s \t observed  = %5s \t result = %5s \t",f,expected, observed,result))
    end
end
