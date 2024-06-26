classdef SixSigma
    properties(Access = public)
        x_barbar;
        r_bar;
        xbar_line;
        r_line;
        data;
        sizes;
        Cp;
        Cpk;
        x_sigma;
        r_sigma;
        x_UCL;
        x_LCL;
        r_UCL;
        r_LCL;



    end

    methods
        function obj = SixSigma(input)
            obj.data = input;
            obj.sizes = length(input(1,:));
            obj.r_line = zeros(obj.sizes, 1);
            obj.xbar_line = zeros(obj.sizes, 1);
            obj = obj.bar_chart(obj);
            obj = obj.set_avgs(obj);
            obj = obj.set_sigma(obj);
            obj = obj.set_limits(obj);
            obj = obj.set_Cp(obj);
            obj = obj.set_Cpk(obj);
        end

    end 
    methods(Static, Access = public)


        function [out] = get_Xbarbar(obj)
        
            out = obj.x_barbar;
            
        end 

        function [out] = get_xbarLine(obj)
        
            out = obj.xbar_line;
            
        end 

        function [out] = get_size(obj)
        
            out = obj.sizes;
            
        end 

        function [out] = get_rLine(obj)
        
            out = obj.r_line;
            
        end

        function [out] = get_rBar(obj)
        
            out = obj.r_bar;
            
        end 

        function [out] = get_Cp(obj)
        
            out = obj.Cp;
            
        end 

        function [out] = get_Cpk(obj)
        
            out = obj.Cpk;
            
        end 


    end

    methods(Static, Access = private)

        function obj = set_Cp(obj)
            obj.Cp = (2 * .1) / (6 * obj.x_sigma);




        end 




        function obj = set_Cpk(obj)
            obj.Cpk = min((obj.x_barbar - 11.9) / (3 * obj.x_sigma), (12.1 - obj.x_barbar) / (3 * obj.x_sigma));
            



        end 

        function obj = set_limits(obj)
            % obj.x_UCL = obj.x_barbar + 3 *obj.x_sigma;
            % obj.x_LCL = obj.x_barbar - 3 *obj.x_sigma;
            obj.x_UCL = obj.x_barbar + 1.023 *obj.r_bar;
            obj.x_LCL = obj.x_barbar - 1.023 *obj.r_bar;
            obj.r_UCL = obj.r_bar * 2.575;
            obj.r_LCL = 0;
        

        end 

        function obj = set_sigma(obj)
            
            obj.x_sigma = sqrt( (1 / (obj.sizes - 1)) * (transpose(obj.xbar_line - obj.x_barbar) * (obj.xbar_line - obj.x_barbar)) );
            obj.r_sigma = obj.r_bar / 1.693;

            

        end

        function obj = set_avgs(obj)
            
            V_one = ones(1,obj.sizes);
            obj.x_barbar = ((V_one) * obj.xbar_line) / obj.sizes;
            obj.r_bar = ((V_one) * obj.r_line) / obj.sizes;

        end

        function obj = bar_chart(obj)

            for i=1:obj.get_size(obj)
                for j=1:3
                    obj.xbar_line(i) = obj.xbar_line(i) + obj.data(j, i);

                end
                
                obj.xbar_line(i) = obj.xbar_line(i) / 3;
                obj.r_line(i) = abs(max(obj.data(:, i)) - min(obj.data(:, i)));

            end


        end

    end


end
