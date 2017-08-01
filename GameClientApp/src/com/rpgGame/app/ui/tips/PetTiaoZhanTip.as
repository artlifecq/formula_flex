package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import feathers.controls.StateSkin;
	
	public class PetTiaoZhanTip extends SkinUI implements ITip
	{
		private var _pet:Q_girl_advance;
		public function PetTiaoZhanTip(skin:StateSkin=null)
		{
			super(skin);
		}
		
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_pet=data as Q_girl_advance;
			var arr:Array=_pet.q_id.split('_');
			var modId:int=parseInt(arr[0]);
			var rank:int=parseInt(arr[1]);
			var q_girl_pet:Q_girl_pet=PetCfg.getPet(modId);
			var petinfo:PetInfo=Mgr.petMgr.getPet(modId);
			var zhanli:Array=JSONUtil.decode(q_girl_pet.q_need_power);
			var prizes:Array=JSONUtil.decode(q_girl_pet.q_zone_reward);
			
			var power:int=zhanli[rank-1];
			var prize:Array=prizes[rank-1];
			var isTongguan:Boolean=petinfo.passlevel>=rank;
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : PetTiaoZhanTip = null;
		
		public static function get instance() : PetTiaoZhanTip
		{
			if (null == _instance)
			{
				_instance = new PetTiaoZhanTip();
			}
			return _instance;
		}
	}
}