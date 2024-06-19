function Uc=dead(Ur,S1)		%死区非线性环节仿真程序
	if(abs(Ur)>=S1)
		if(Ur>0)
			Uc=Ur-S1;
		else
			Uc=Ur+S1;
		end
	else
		Uc=0;
	end
end

