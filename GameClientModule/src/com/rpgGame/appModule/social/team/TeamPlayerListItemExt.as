package  com.rpgGame.appModule.social.team
{

	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.ClientSceneCfgData;
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
		public function TeamPlayerListItemExt()
		{
			_skin=new Duiwu_WanjiaItem();
			super(_skin);
		}	
		public function setData(team:*):void
		{
			this._data=team as MapPlayerInfo;
			_skin.lbName.text=_data.playername;
			_skin.lbLevel.text=_data.playerlv+"级";
			_skin.lbZhanli.text=_data.fightPower+"";
			if (_data.teamstate==0) 
			{
				_skin.lbNum.text="【尚未组队】";
				_skin.lbNum.color=GameColorUtil.COLOR_GREEN;
			}
			else
			{
				_skin.lbNum.text="【已组队】";
				_skin.lbNum.color=GameColorUtil.COLOR_RED;
			}
			if (_data.guildname==null||_data.guildname=="") 
			{
				_skin.lbBanghui.text="【尚未入帮】";
			}
			else
			{
				_skin.lbBanghui.text=_data.guildname;
			}
			//_skin.lbMap.text=ClientSceneCfgData.getSceneInfo(_data.line).q_map_name;
			//var qMap:Q_map=MapDataManager.getMapInfo( _data.memberMapModelID ).getData() as Q_map;
			
			setSelectbg(false);
		}
		public function setSelectbg(bool:Boolean):void
		{
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
				curItem.setSelectbg(false);
			}
			curItem=this;
			curItem.setSelectbg(true);
		}
	}
}