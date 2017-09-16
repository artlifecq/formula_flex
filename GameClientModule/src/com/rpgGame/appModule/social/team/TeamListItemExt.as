package  com.rpgGame.appModule.social.team
{
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.team.bean.MapTeamInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.shejiao.zudui.DuiWu_Item;
	
	import starling.display.DisplayObject;


	
	public class TeamListItemExt extends SkinUI
	{
		public static var curItem:TeamListItemExt;
		private var _data:MapTeamInfo;
		private var _skin:DuiWu_Item;
		private var _tipData:DynamicTipData=new DynamicTipData();
		private var _isSelected:Boolean;
		public function TeamListItemExt()
		{
			_skin=new DuiWu_Item();
			super(_skin);
			TipTargetManager.show(this,TargetTipsMaker.makeTips(TipType.TEAM_NEAR_TEAM_TIP,_tipData));
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
			this._data=team as MapTeamInfo;
			this._skin.bg1.visible=index%2==0;
			this._skin.bg2.visible=!_skin.bg1.visible;
			this._skin.selectUsBg.visible=Mgr.teamMgr.hasTeam&&Mgr.teamMgr.teamInfo.teamId.EqualTo(_data.teamid);
			this._tipData.data=data;
			_skin.lbName.text=team.captainname;
			_skin.lbLevel.text=team.captainlv+NotifyCfgData.getNotifyTextByID(61019);
			_skin.lbZhanli.text=team.avgFightPower+"";
			if (team.teamnum<TeamManager.MAXMEMBER) 
			{
				_skin.lbNum.text=team.teamnum+"/"+TeamManager.MAXMEMBER;
				_skin.lbNum.color=GameColorUtil.COLOR_GREEN;
			}
			else
			{
				_skin.lbNum.text="【已满员】";
				_skin.lbNum.color=GameColorUtil.COLOR_RED;
			}
			_skin.lbMap.text=MapDataManager.getMapInfo( _data.captainMap).getData().q_map_name;
			
			setSelected(false);
		}
		public function setSelected(bool:Boolean):void
		{
			_isSelected=bool;
			_skin.selectBg.visible=bool;
		}
		public function get data():MapTeamInfo
		{
			return _data;
		}
		override public function dispose():void
		{
			super.dispose();
			_data=null;
			TipTargetManager.remove(this);
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
			EventManager.dispatchEvent(TeamEvent.TEAM_SLEECT_TEAM,this._data);
		}
	}
}