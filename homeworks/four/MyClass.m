classdef MyClass
    properties
        data
        modifiedData
    end
    
    methods
        function obj = MyClass(inputData)
            if nargin > 0
                obj.data = inputData;
            end
        end
        
        function obj = processData(obj)
            % Process the data and modify the class properties
            % Example: Square each element of the data
            obj.modifiedData = obj.data .^ 2;
        end
    end
end
