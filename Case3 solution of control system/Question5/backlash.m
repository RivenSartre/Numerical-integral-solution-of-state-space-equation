function Uc=backlash(Urb,Ur,Ucb,S1)		%滞环非线性环节仿真程序
	if(Ur>Urb)
		if((Ur-S1)>=Ucb)
			Uc=Ur-S1;
		else
			Uc=Ucb;
		end
	else if(Ur<Urb)
			if((Ur+S1)<=Ucb)
				Uc=Ur+S1;
			else
				Uc=Ucb;
			end
		else
			Uc=Ucb;
		end
	end
	Ubb=Ur;
end

