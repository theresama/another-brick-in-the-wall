
module paddle(input [9:0] x, input [9:0] y,
	output [9:0] red, output [9:0] green, output [9:0] blue, input clk, input moveleft, input moveright);
	
reg [2:0] idx;

reg[25:0] slowclk = 0;

//integer vX = 50;
//integer vY = 50;

reg[9:0] paddlex1, paddlex2, paddley1, paddley2;
reg[9:0] ballx1, ballx2, bally1, bally2;

reg[9:0] ballvx, ballvy;

reg[9:0] brick1x1, brick1y1, brick1x2, brick1y2;
reg brick1vis = 0;

reg[9:0] brick2x1, brick2y1, brick2x2, brick2y2;
reg brick2vis = 0;

reg[9:0] brick3x1, brick3y1, brick3x2, brick3y2;
reg brick3vis = 0;

reg[9:0] brick4x1, brick4y1, brick4x2, brick4y2;
reg brick4vis = 0;

reg[9:0] brick5x1, brick5y1, brick5x2, brick5y2;
reg brick5vis = 0;

reg[9:0] brick6x1, brick6y1, brick6x2, brick6y2;
reg brick6vis = 0;

reg[9:0] brick7x1, brick7y1, brick7x2, brick7y2;
reg brick7vis = 0;

reg[9:0] brick8x1, brick8y1, brick8x2, brick8y2;
reg brick8vis = 0;


initial begin
		
	paddlex1 <= 220;
	paddley1 <= 450;
	paddlex2 <= 120;
	paddley2 <= 30;
	
	ballx1 = 310;
	bally1 = 230;
	ballx2 = 20;
	bally2 = 20;
	
	ballvx = 1;
	ballvy = 1;
	
	brick1x1 <= 50;
	brick1y1 <= 30;
	brick1x2 <= 120;
	brick1y2 <= 40;
	brick1vis = 0;
	
	brick2x1 <= 190;
	brick2y1 <= 30;
	brick2x2 <= 120;
	brick2y2 <= 40;
	brick2vis = 0;
	
	brick3x1 <= 330;
	brick3y1 <= 30;
	brick3x2 <= 120;
	brick3y2 <= 40;
	brick3vis = 0;
	
	brick4x1 <= 470;
	brick4y1 <= 30;
	brick4x2 <= 120;
	brick4y2 <= 40;
	brick4vis = 0;
	
	brick5x1 <= 50;
	brick5y1 <= 90;
	brick5x2 <= 120;
	brick5y2 <= 40;
	brick5vis = 0;
	
	brick6x1 <= 190;
	brick6y1 <= 90;
	brick6x2 <= 120;
	brick6y2 <= 40;
	brick6vis = 0;
	
	brick7x1 <= 330;
	brick7y1 <= 90;
	brick7x2 <= 120;
	brick7y2 <= 40;
	brick7vis = 0;
	
	brick8x1 <= 470;
	brick8y1 <= 90;
	brick8x2 <= 120;
	brick8y2 <= 40;
	brick8vis = 0;
	
	
	
end

always @(posedge moveleft or posedge moveright)
begin

	if (moveleft)
	begin
		if (paddlex1 > 10)
		paddlex1 = paddlex1 - 10;
	end
	
	if (moveright)
	begin
		if (paddlex1 < 510)
		paddlex1 = paddlex1 + 10;
	end
	

	
end



always @(posedge clk)
begin

	slowclk = slowclk + 1;
	
	if (slowclk == 26'hf4240)
	begin
		slowclk = 0;
		
		//move the ball 
	ballx1 = ballx1 + ballvx;
	bally1 = bally1 - ballvy;
	
	//detecting wall collisions
	if ((bally1 == 0 || bally1 < 0) && (ballvx == 1 && ballvy == 1))
		begin	
			ballvx = ballvx;
			ballvy = 0 - (ballvy + 1);
			ballx1 = ballx1 + ballvx;
			bally1 = bally1 - ballvy;
			ballvy = ballvy + 1;
		end
	
	else if ((bally1 == 0 || bally1 < 0) && (ballvx == 10'b1111111111 && ballvy == 1))
		begin	
			ballvx = ballvx;
			ballvy = 0 - ballvy;
			ballx1 = ballx1 + ballvx;
			bally1 = bally1 - ballvy;
		end
		
	else if ((ballx1 == 620 || ballx1 > 620) && (ballvx == 1 && ballvy == 10'b1111111111))
		begin	
			ballvx = 0 - ballvx;
			ballvy = ballvy;
			ballx1 = ballx1 + ballvx;
			bally1 = bally1 - ballvy;
		end
	
	else if ((ballx1 == 620 || ballx1 > 620) && (ballvx == 1 && ballvy == 1))
		begin	
			ballvx = 0 - ballvx;
			ballvy = ballvy;
			ballx1 = ballx1 + ballvx;
			bally1 = bally1 - ballvy;
		end
		
	// else if ((bally1 == 480 || bally1 > 480) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111))
	// 	begin	
	// 		ballvx = ballvx;
	// 		ballvy = 0 - ballvy;
	// 		ballx1 = ballx1 + ballvx;
	// 		bally1 = bally1 - ballvy;
	// 	end
	
	// else if ((bally1 == 480 || bally1 > 480) && (ballvx == 5 && ballvy == 10'b1111111111))
	// 	begin	
	// 		ballvx = ballvx;
	// 		ballvy = 0 - ballvy;
	// 		ballx1 = ballx1 + ballvx;
	// 		bally1 = bally1 - ballvy;
	// 	end
		
	else if ((ballx1 == 0 || ballx1 < 0) && (ballvx == 10'b1111111111 && ballvy == 1))
		begin	
			ballvx = 0 - ballvx;
			ballvy = ballvy;
			ballx1 = ballx1 + ballvx;
			bally1 = bally1 - ballvy;
		end
	
	else if ((ballx1 == 0 || ballx1 < 0) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111))
		begin	
			ballvx = 0 - ballvx;
			ballvy = ballvy;
			ballx1 = ballx1 + ballvx;
			bally1 = bally1 - ballvy;
		end

	//detect paddle hit coming from right side
	else if (((bally1) == 430 || bally1> 430) && ((ballx1 > paddlex1) && ((ballx2 + ballx1) < (paddlex1 + paddlex2)))  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111))
		begin	
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	
	//detect paddle hit coming from left side
	else if ((bally1 == 430 || bally1 > 430) && ((ballx1 > paddlex1) && ((ballx2 + ballx1) < (paddlex1 + paddlex2)))  && (ballvx == 1 && ballvy == 10'b1111111111))
		begin	
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//bottom reset
	else if (bally1 == 480 || bally1 > 480)
		begin	
			ballx1 = 310;
			bally1 = 230;
			ballvx = 1;
			ballvy = 1;
			brick1vis = 0;
			brick2vis = 0;
			brick3vis = 0;
			brick4vis = 0;
			brick5vis = 0;
			brick6vis = 0;
			brick7vis = 0;
			brick8vis = 0;
		end


	//detect brick1 collision

	//hitting top border
	else if ((bally1 >= brick1y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick1x1) && ( brick1x1 + brick1x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick1x1 + brick1x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick1y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick1x1) && ( brick1x1 + brick1x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick1x1 + brick1x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick1y1 + brick1y2) && ((ballx1 >= brick1x1) && ( brick1x1 + brick1x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick1y1 + brick1y2) && ((ballx1 >= brick1x1) && ( brick1x1 + brick1x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick1x1 + brick1x2) && (brick1y1 <= (bally1 + bally2))  && ((brick1y1 + brick1y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick1x1 + brick1x2) && (brick1y1 <= (bally1 + bally2))  && ((brick1y1 + brick1y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick1x1) && (ballx1 < brick1x1 + brick1x2) && (brick1y1 <= (bally1 + bally2))  && ((brick1y1 + brick1y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick1x1) && (ballx1 < brick1x1 + brick1x2) && (brick1y1 <= (bally1 + bally2))  && ((brick1y1 + brick1y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick1vis == 0)
		begin	
			brick1vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end



	//detect brick2 collision

	//hitting top border
	else if ((bally1 >= brick2y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick2x1) && ( brick2x1 + brick2x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick2x1 + brick2x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick2y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick2x1) && ( brick2x1 + brick2x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick2x1 + brick2x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick2y1 + brick2y2) && ((ballx1 >= brick2x1) && ( brick2x1 + brick2x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick2y1 + brick2y2) && ((ballx1 >= brick2x1) && ( brick2x1 + brick2x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick2x1 + brick2x2) && (brick2y1 <= (bally1 + bally2))  && ((brick2y1 + brick2y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick2x1 + brick2x2) && (brick2y1 <= (bally1 + bally2))  && ((brick2y1 + brick2y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick2x1) && (ballx1 < brick2x1 + brick2x2) && (brick2y1 <= (bally1 + bally2))  && ((brick2y1 + brick2y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick2x1) && (ballx1 < brick2x1 + brick2x2) && (brick2y1 <= (bally1 + bally2))  && ((brick2y1 + brick2y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick2vis == 0)
		begin	
			brick2vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


		//detect brick3 collision

	//hitting top border
	else if ((bally1 >= brick3y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick3x1) && ( brick3x1 + brick3x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick3x1 + brick3x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick3y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick3x1) && ( brick3x1 + brick3x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick3x1 + brick3x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick3y1 + brick3y2) && ((ballx1 >= brick3x1) && ( brick3x1 + brick3x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick3y1 + brick3y2) && ((ballx1 >= brick3x1) && ( brick3x1 + brick3x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick3x1 + brick3x2) && (brick3y1 <= (bally1 + bally2))  && ((brick3y1 + brick3y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick3x1 + brick3x2) && (brick3y1 <= (bally1 + bally2))  && ((brick3y1 + brick3y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick3x1) && (ballx1 < brick3x1 + brick3x2) && (brick3y1 <= (bally1 + bally2))  && ((brick3y1 + brick3y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick3x1) && (ballx1 < brick3x1 + brick3x2) && (brick3y1 <= (bally1 + bally2))  && ((brick3y1 + brick3y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick3vis == 0)
		begin	
			brick3vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end



		//detect brick4 collision

	//hitting top border
	else if ((bally1 >= brick4y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick4x1) && ( brick4x1 + brick4x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick4x1 + brick4x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick4y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick4x1) && ( brick4x1 + brick4x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick4x1 + brick4x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick4y1 + brick4y2) && ((ballx1 >= brick4x1) && ( brick4x1 + brick4x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick4y1 + brick4y2) && ((ballx1 >= brick4x1) && ( brick4x1 + brick4x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick4x1 + brick4x2) && (brick4y1 <= (bally1 + bally2))  && ((brick4y1 + brick4y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick4x1 + brick4x2) && (brick4y1 <= (bally1 + bally2))  && ((brick4y1 + brick4y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick4x1) && (ballx1 < brick4x1 + brick4x2) && (brick4y1 <= (bally1 + bally2))  && ((brick4y1 + brick4y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick4x1) && (ballx1 < brick4x1 + brick4x2) && (brick4y1 <= (bally1 + bally2))  && ((brick4y1 + brick4y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick4vis == 0)
		begin	
			brick4vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end



	//detect brick5 collision

	//hitting top border
	else if ((bally1 >= brick5y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick5x1) && ( brick5x1 + brick5x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick5x1 + brick5x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick5y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick5x1) && ( brick5x1 + brick5x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick5x1 + brick5x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick5y1 + brick5y2) && ((ballx1 >= brick5x1) && ( brick5x1 + brick5x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick5y1 + brick5y2) && ((ballx1 >= brick5x1) && ( brick5x1 + brick5x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick5x1 + brick5x2) && (brick5y1 <= (bally1 + bally2))  && ((brick5y1 + brick5y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick5x1 + brick5x2) && (brick5y1 <= (bally1 + bally2))  && ((brick5y1 + brick5y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick5x1) && (ballx1 < brick5x1 + brick5x2) && (brick5y1 <= (bally1 + bally2))  && ((brick5y1 + brick5y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick5x1) && (ballx1 < brick5x1 + brick5x2) && (brick5y1 <= (bally1 + bally2))  && ((brick5y1 + brick5y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick5vis == 0)
		begin	
			brick5vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


		//detect brick6 collision

	//hitting top border
	else if ((bally1 >= brick6y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick6x1) && ( brick6x1 + brick6x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick6x1 + brick6x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick6y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick6x1) && ( brick6x1 + brick6x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick6x1 + brick6x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick6y1 + brick6y2) && ((ballx1 >= brick6x1) && ( brick6x1 + brick6x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick6y1 + brick6y2) && ((ballx1 >= brick6x1) && ( brick6x1 + brick6x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick6x1 + brick6x2) && (brick6y1 <= (bally1 + bally2))  && ((brick6y1 + brick6y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick6x1 + brick6x2) && (brick6y1 <= (bally1 + bally2))  && ((brick6y1 + brick6y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick6x1) && (ballx1 < brick6x1 + brick6x2) && (brick6y1 <= (bally1 + bally2))  && ((brick6y1 + brick6y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick6x1) && (ballx1 < brick6x1 + brick6x2) && (brick6y1 <= (bally1 + bally2))  && ((brick6y1 + brick6y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick6vis == 0)
		begin	
			brick6vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end



	//detect brick7 collision

	//hitting top border
	else if ((bally1 >= brick7y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick7x1) && ( brick7x1 + brick7x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick7x1 + brick7x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick7y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick7x1) && ( brick7x1 + brick7x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick7x1 + brick7x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick7y1 + brick7y2) && ((ballx1 >= brick7x1) && ( brick7x1 + brick7x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick7y1 + brick7y2) && ((ballx1 >= brick7x1) && ( brick7x1 + brick7x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick7x1 + brick7x2) && (brick7y1 <= (bally1 + bally2))  && ((brick7y1 + brick7y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick7x1 + brick7x2) && (brick7y1 <= (bally1 + bally2))  && ((brick7y1 + brick7y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick7x1) && (ballx1 < brick7x1 + brick7x2) && (brick7y1 <= (bally1 + bally2))  && ((brick7y1 + brick7y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick7x1) && (ballx1 < brick7x1 + brick7x2) && (brick7y1 <= (bally1 + bally2))  && ((brick7y1 + brick7y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick7vis == 0)
		begin	
			brick7vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


		//detect brick8 collision

	//hitting top border
	else if ((bally1 >= brick8y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick8x1) && ( brick8x1 + brick8x2 >= (ballx1) ) && (ballx1 + ballx2 <= brick8x1 + brick8x2)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 >= brick8y1) && (95 >= (bally1 + bally2))  && ((ballx1 >= brick8x1) && ( brick8x1 + brick8x2 >= (ballx1) )  && (ballx1 + ballx2 <= brick8x1 + brick8x2) && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting bottom border
	else if ((bally1 <= brick8y1 + brick8y2) && ((ballx1 >= brick8x1) && ( brick8x1 + brick8x2 >= (ballx1) )  && (ballvx == 1 && ballvy == 1)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end
	else if ((bally1 <= brick8y1 + brick8y2) && ((ballx1 >= brick8x1) && ( brick8x1 + brick8x2 >= (ballx1) )  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = ballvx;
			ballvy = 0 - ballvy;
		end

	//hitting right border
	else if ((ballx1 <= brick8x1 + brick8x2) && (brick8y1 <= (bally1 + bally2))  && ((brick8y1 + brick8y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 10'b1111111111)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end
	else if ((ballx1 <= brick8x1 + brick8x2) && (brick8y1 <= (bally1 + bally2))  && ((brick8y1 + brick8y2 >= bally1)  && (ballvx == 10'b1111111111 && ballvy == 1)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end


	//hitting left border
	else if ((ballx1 + ballx2 >= brick8x1) && (ballx1 < brick8x1 + brick8x2) && (brick8y1 <= (bally1 + bally2))  && ((brick8y1 + brick8y2 >= bally1)  && (ballvx == 1 && ballvy == 10'b1111111111)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	else if ((ballx1 + ballx2 >= brick8x1) && (ballx1 < brick8x1 + brick8x2) && (brick8y1 <= (bally1 + bally2))  && ((brick8y1 + brick8y2 >= bally1)  && (ballvx == 1 && ballvy == 1)) && brick8vis == 0)
		begin	
			brick8vis = 1;
			ballvx = 0 - ballvx;
			ballvy = ballvy;
		end

	
		
		
		
	end

end


always @(x, y, clk, moveleft, moveright)
begin
	if ((paddlex1 < x) & (x < paddlex2 + paddlex1) & (paddley1 < y) & (y < paddley2 + paddley1))
		begin
		idx = 3'd0;	
		end
	else if ((ballx1 < x) & (x < ballx2 + ballx1) & (bally1 < y) & (y < bally2 + bally1) )
		begin
		idx = 3'd1;	
		end
	
	else if ((brick1x1 < x) & (x < brick1x2 + brick1x1) & (brick1y1 < y) & (y < brick1y2 + brick1y1) )
		begin
		if (brick1vis == 1)
			idx = 3'd7;	
		else if (brick1vis == 0)
			idx = 3'd2;
		end
	else if ((brick2x1 < x) & (x < brick2x2 + brick2x1) & (brick2y1 < y) & (y < brick2y2 + brick2y1) )
		begin
		if (brick2vis == 1)
			idx = 3'd7;	
		else if (brick2vis == 0)
			idx = 3'd2;
		end
	else if ((brick3x1 < x) & (x < brick3x2 + brick3x1) & (brick3y1 < y) & (y < brick3y2 + brick3y1))
		begin
		if (brick3vis == 1)
			idx = 3'd7;	
		else if (brick3vis == 0)
			idx = 3'd2;	
		end
	else if ((brick4x1 < x) & (x < brick4x2 + brick4x1) & (brick4y1 < y) & (y < brick4y2 + brick4y1) )
		begin
		if (brick4vis == 1)
			idx = 3'd7;	
		else if (brick4vis == 0)
			idx = 3'd2;
		end
	else if ((brick5x1 < x) & (x < brick5x2 + brick5x1) & (brick5y1 < y) & (y < brick5y2 + brick5y1) )
		begin
		if (brick5vis == 1)
			idx = 3'd7;	
		else if (brick5vis == 0)
			idx = 3'd2;
		end
	else if ((brick6x1 < x) & (x < brick6x2 + brick6x1) & (brick6y1 < y) & (y < brick6y2 + brick6y1))
		begin
		if (brick6vis == 1)
			idx = 3'd7;	
		else if (brick6vis == 0)
			idx = 3'd2;	
		end
	else if ((brick7x1 < x) & (x < brick7x2 + brick7x1) & (brick7y1 < y) & (y < brick7y2 + brick7y1))
		begin
		if (brick7vis == 1)
			idx = 3'd7;	
		else if (brick7vis == 0)
			idx = 3'd2;
		end
	else if ((brick8x1 < x) & (x < brick8x2 + brick8x1) & (brick8y1 < y) & (y < brick8y2 + brick8y1))
		begin
		if (brick8vis == 1)
			idx = 3'd7;	
		else if (brick8vis == 0)
			idx = 3'd2;
		end

	else begin
		idx <= 3'd7;
	end

end


assign red = (idx[0]? 10'h3ff: 10'h000);
assign green = (idx[1]? 10'h3ff: 10'h000);
assign blue = (idx[2]? 10'h3ff: 10'h000);


endmodule
