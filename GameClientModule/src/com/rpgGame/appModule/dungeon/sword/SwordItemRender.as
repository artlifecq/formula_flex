package com.rpgGame.appModule.dungeon.sword
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_TiaoZhanItem;
	
	import starling.display.DisplayObject;
	
	/**
	 *论剑元素渲染器
	 *@author dik
	 *2017-5-2下午7:36:11
	 */
	public class SwordItemRender extends DefaultListItemRenderer
	{
		private var _skin:LunJian_TiaoZhanItem;
		
		public function SwordItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new LunJian_TiaoZhanItem();
			_skin.toSprite(this);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btnTiaozhan){
				AppManager.closeAllApp();
				var itemData:SwordItemData=_data as SwordItemData;
//				SceneSender.reqEnterDungeon(itemData.basicCfg.q_zone_id,itemData.basicCfg.q_id);
				SceneSender.reqEnterDungeon(itemData.basicCfg.q_zone_id,1);
			}
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				var itemData:SwordItemData=_data as SwordItemData;
				var npcCfg:Q_monster=MonsterDataManager.getData(itemData.basicCfg.q_npc);
				_skin.lbName.text=npcCfg.q_name;
				_skin.lbLevel.text=itemData.basicCfg.q_level+"";
				_skin.lbZhanli.text=itemData.basicCfg.q_attack_power+"";
			}
		}
	}
}