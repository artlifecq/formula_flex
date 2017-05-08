package com.rpgGame.appModule.dungeon.lunjian
{
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.info.map.SceneData;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_NameItem;
	
	/**
	 *npc所在地图渲染器
	 *@author dik
	 *2017-5-2下午7:32:40
	 */
	public class NpcMapItemRender extends DefaultListItemRenderer
	{
		private var _skin:LunJian_NameItem;
		
		public function NpcMapItemRender()
		{
			super();
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
			
		
		override protected function initialize():void
		{
			_skin=new LunJian_NameItem();
			_skin.toSprite(this);
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				var data:SceneData=_data as SceneData;
				_skin.lbName.text=data.name;
				_skin.lbLevel.text="("+data.requiredLevel+")";
				var list:Vector.<Q_lunjian>=LunJianCfg.getCfgByMapId(data.sceneId);
				var num:int=0;
				var len:int=list.length;
				for(var i:int=0;i<len;i++){
					
				}
//				_skin.lbNum.text=data.leftNum.toString();
//				_skin.lbNum.visible=_skin.numBg.visible=data.leftNum!=0;
			}
		}
	}
}