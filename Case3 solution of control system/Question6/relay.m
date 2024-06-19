function Uc=relay(Ur,S1)		%继电非线性环节仿真程序
	if(Ur>=0)
		Uc=S1;
	else
		Uc=-S1;
	end
end
