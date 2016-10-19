package com.rpgGame.app.ui.main.task.eventTrackItem
{
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.TouJingCfgData;
	import com.rpgGame.coreData.info.toujing.TouJingBookStateData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.dailyTaskEventTrack.item.TouJingListItemSkin;
	
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 每项国家强弱、经书状态 
	 * @author 陈鹉光
	 * 
	 */	
	public class TouJingListItem extends DefaultListItemRenderer
	{
		private var _skin:TouJingListItemSkin;
//		/** lable原来的Y坐标 **/
//		private var originalY:Number;
		/** _data数据 **/
		private var itemData:TouJingBookStateData
		
		public function TouJingListItem()
		{
			super();
		}
		
		override protected function initialize() : void
		{
			super.initialize();
			_skin = new TouJingListItemSkin();
			_skin.toSprite(this);
//			originalY = _skin.countryName.y;
			_skin.countryName.addEventListener( TouchEvent.TOUCH, onLabTouch );
		}
		
		/**
		 * list每一项直接的间距 
		 * @return
		 * 
		 */		
		override public function get height():Number
		{
			if( _skin == null )
				return 25;
			return _skin.itemBg.height + 2;
		}
		
		private function onLabTouch( e:TouchEvent ) : void
		{
			var touch:Touch;
			touch = e.getTouch(_skin.countryName);
			if (touch == null)
			{
				onMouseOut();
				return;
			}
			
			touch = e.getTouch(_skin.countryName, TouchPhase.HOVER);
			if (touch != null)
				onMouseMove();
			
			touch = e.getTouch(_skin.countryName, TouchPhase.BEGAN);
			if (touch == null)
				return;
			onClick();
		}
		
		/**
		 *  点击国家名称可以寻路到边境
		 * 
		 */		
		private function onClick():void
		{
			var npcData:MonsterDataProto;
			if( itemData.countryId == MainRoleManager.actorInfo.sceneSequence )//点击的国家等于玩家所在场景的国家
				npcData = MonsterDataManager.getData( TouJingCfgData.acceptNpcID );
			else
				npcData = MonsterDataManager.getData( NpcCfgData.countryTransNPCId );
			
			if( npcData == null )
				return;
			
			var pos:Point=MonsterDataManager.getMonsterPosition(npcData);
			var role:SceneRole = SceneManager.getScene().getSceneObjByID(npcData.id, SceneCharType.NPC ) as SceneRole;
			SceneRoleSelectManager.selectedRole = role;
			MainRoleSearchPathManager.walkToScene(npcData.sceneId, pos.x ,  pos.y, null, 200 );
		}
		
		private function onMouseMove() : void
		{
//			_skin.countryName.y = originalY + 2;
			_skin.countryName.color = 0x00ff00;
		}
		
		private function onMouseOut() : void
		{
//			_skin.countryName.y = originalY;
			_skin.countryName.color = 0xF3E6D4;
		}
		
		override protected function commitData() : void
		{
			itemData = _data as TouJingBookStateData;
			if( itemData == null )
				return;
			
			if (itemData)
			{
				_skin.countryName.htmlText = "【" + CountryNameCfgData.getCountryNameById( itemData.countryId ) + "】" + " : ";
				_skin.countryLevel.htmlText = "（" + HtmlTextUtil.getTextColor( TouJingManager.getColorByCountryId( itemData.countryId ), CountryManager.getCountryJingShuState(itemData.countryId) ) + "）";
				_skin.countryJingShu.htmlText = itemData.countryJingShu.toString();
				_skin.itemBg.alpha = (index % 2 == 0 ? 0 : 1); //不要用visible，需要交互！
			}
			else
			{
				_skin.countryName.htmlText = "";
				_skin.countryLevel.htmlText = "";
				_skin.countryJingShu.htmlText = "";
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
	}
}