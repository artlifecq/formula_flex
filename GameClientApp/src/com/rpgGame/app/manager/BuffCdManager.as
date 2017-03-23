package com.rpgGame.app.manager
{
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;

	/**
	 *buff cd管理 
	 * @author dik
	 * 
	 */
	public class BuffCdManager
	{
		public function BuffCdManager()
		{
		}
		/**
		 *获得buff的CD KEY 
		 * @param roleId
		 * @param buffid
		 * @return 
		 * 
		 */
		public static function getBuffKey(buffData:BuffData) : String
		{
			return FaceTypeEnum.BUFF+"_"+buffData.roleId + "_" + buffData.buffData.q_buff_id;
		}
		
		public static function playBuffCd(buffData:BuffData):void
		{
			var now:int=buffData.totalTime-buffData.disappearTime;
			CDDataManager.playCD(getBuffKey(buffData), buffData.totalTime, now);
		}
	}
}