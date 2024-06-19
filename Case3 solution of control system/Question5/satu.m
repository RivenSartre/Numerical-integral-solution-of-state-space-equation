function Uc=satu(Ur,S1)		%饱和非线性环节仿真程序
	if(abs(Ur)>=S1)
		if(Ur>0)
			Uc=S1;
		else
			Uc=-S1;
		end
	else
		Uc=Ur;
	end
end

