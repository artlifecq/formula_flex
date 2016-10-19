package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.sender.BaseSender;
	
	import app.cmd.SummonModuleMessages;
	
	public class SummonSender extends BaseSender
	{
		public function SummonSender()
		{
			super();
		}
		
		public static function officeSummon(id:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(id);
			send(SummonModuleMessages.C2S_COUNTRY_OFFICER_SUMMON,_bytes);
		}
	}
}