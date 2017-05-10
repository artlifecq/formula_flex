package com.rpgGame.appModule.dungeon.lunjian
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_TiaoZhanItem;
	
	import starling.display.DisplayObject;
	
	/**
	 *论剑元素渲染器
	 *@author dik
	 *2017-5-2下午7:36:11
	 */
	public class LunJianItemRender extends DefaultListItemRenderer
	{
		private var _skin:LunJian_TiaoZhanItem;
		
		public function LunJianItemRender()
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
				var itemData:LunJianItemData=_data as LunJianItemData;
				DungeonSender.reqEnterDungeon(itemData.cfg.q_zone_id,itemData.cfg.q_id);
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
				var itemData:LunJianItemData=_data as LunJianItemData;
				var npcCfg:Q_monster=MonsterDataManager.getData(itemData.cfg.q_npc);
				_skin.lbName.text=npcCfg.q_name;
				_skin.lbLevel.text=itemData.cfg.q_level+"";
				_skin.lbZhanli.text=itemData.cfg.q_attack_power+"";
				_skin.mc_nandu.gotoAndStop(itemData.diff.toString());
			}
		}
	}
}