package  com.rpgGame.appModule.social.team
{

	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.netData.team.bean.MapPlayerInfo;
	
	import org.mokylin.skin.app.shejiao.zudui.Duiwu_WanjiaItem;
	
	import starling.display.DisplayObject;


	
	public class TeamPlayerListItemExt extends SkinUI
	{
		public static var curItem:TeamPlayerListItemExt;
		private var _data:MapPlayerInfo;
		private var _skin:Duiwu_WanjiaItem;
		private var _isSelected:Boolean;
		public function TeamPlayerListItemExt()
		{
			_skin=new Duiwu_WanjiaItem();
			super(_skin);
			setSelected(false);
			var touch:TouchCtrl=new TouchCtrl(this,null,onOver,onOut);
		}	
		
		private function onOut():void
		{
			// TODO Auto Generated method stub
			if (!_isSelected) 
			{
				_skin.selectBg.visible=false;
			}
		}
		
		private function onOver():void
		{
			// TODO Auto Generated method stub
			_skin.selectBg.visible=true;
		}	
		public function setData(team:*,index:int):void
		{
			this._data=team as MapPlayerInfo;
			this._skin.bg1.visible=index%2==0;
			this._skin.bg2.visible=!_skin.bg1.visible;
			this._skin.selectUsBg.visible=MainRoleManager.serverGid==_data.playerid.ToGID();
			_skin.lbName.text=_data.playername;
			_skin.lbLevel.text=_data.playerlv+NotifyCfgData.getNotifyTextByID(61019);
			_skin.lbZhanli.text=_data.fightPower+"";
			if (_data.teamstate==0) 
			{
				_skin.lbNum.text=NotifyCfgData.getNotifyTextByID(61043);
				_skin.lbNum.color=GameColorUtil.COLOR_GREEN;
			}
			else
			{
				_skin.lbNum.text=NotifyCfgData.getNotifyTextByID(61044);
				_skin.lbNum.color=GameColorUtil.COLOR_RED;
			}
			if (_data.guildname==null||_data.guildname=="") 
			{
				_skin.lbBanghui.text=NotifyCfgData.getNotifyTextByID(61045);
			}
			else
			{
				_skin.lbBanghui.text=_data.guildname;
			}
			//_skin.lbMap.text=ClientSceneCfgData.getSceneInfo(_data.line).q_map_name;
			var qMap:Q_map=MapDataManager.getMapInfo( MapDataManager.currentScene.sceneId).getData() as Q_map;
			_skin.lbMap.text=qMap.q_map_name+"."+_data.line+"线";
			setSelected(false);
		}
		public function setSelected(bool:Boolean):void
		{
			_isSelected=bool;
			_skin.selectBg.visible=bool;
		}

		public function get data():MapPlayerInfo
		{
			return _data;
		}
		override public function dispose():void
		{
			super.dispose();
			_data=null;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (curItem) 
			{
				curItem.setSelected(false);
			}
			curItem=this;
			curItem.setSelected(true);
		}
	}
}