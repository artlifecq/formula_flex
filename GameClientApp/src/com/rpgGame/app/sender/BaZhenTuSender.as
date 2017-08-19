package com.rpgGame.app.sender
{
	

	public class BaZhenTuSender extends BaseSender
	{
		/**
		 * 拒绝
		 */
		public static function refruseReq() : void
		{
			_bytes.clear();
//			send(BaZhenTuModuleMessages.C2S_REFRUSE, _bytes);
		}
		/**
		 * 同意
		 */
		public static function argeeReq() : void
		{
			_bytes.clear();
//			send(BaZhenTuModuleMessages.C2S_AGREE, _bytes);
		}
	}
}