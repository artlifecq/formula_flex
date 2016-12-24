package com.rpgGame.app.sender
{
	

	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-8-12 下午5:27:45
	 */
	
	public class LookSender extends BaseSender
	{
		/**
		 * 要求查看其他玩家信息
		 * @param roleID 要查看的英雄id
		 * @param isNotify 是否要告诉目标当前有人在查看你 
		 * 
		 */		
		public static function reqLook(roleID:Number, isNotify:Boolean = false) : void
		{
//			if(ReqLockUtil.isReqLocked(ViewOtherHeroModuleMessages.C2S_VIEW_OTHER_HERO, true)) return;
//			
//			_bytes.clear();
//			_bytes.writeVarint64(roleID);
//			_bytes.writeBoolean(isNotify);
//			send(ViewOtherHeroModuleMessages.C2S_VIEW_OTHER_HERO, _bytes);
//			
//			ReqLockUtil.lockReq(ViewOtherHeroModuleMessages.C2S_VIEW_OTHER_HERO, 10000)
		}
	}
}