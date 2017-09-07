package  com.rpgGame.app.ui.main.openActivity
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.main.openActivity.comps.ISpecialActivityInter;
	import com.rpgGame.app.ui.main.openActivity.comps.ITopBtn;
	import com.rpgGame.app.ui.main.openActivity.comps.ITopSortBtn;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	import com.rpgGame.coreData.info.openActivity.EnumCampsFlag;
	import com.rpgGame.coreData.utils.ActivityUtil;
	
	
	public class ActivityIconExt extends BaseOpenActivityBtn implements ISpecialActivityInter,ITopBtn,ITopSortBtn
	{
		private static var defaultSortId:int=-100;
		
		/**首充、平台游戏礼包、超级会员 这三个必须排在最后所以在这里修改权重**/
		public static function changeSortId(sort:int):int
		{
			if (sort==EnumCampPanelType.M_FIRST_BUY) 
			{
				return 100000;
			}
			else if (sort==EnumCampPanelType.M_PLATFORM_37) 
			{
				return 100001
			}
			else if (sort==EnumCampPanelType.M_SUPER_VIP_37) 
			{
				return 100002;
			}
			else if (sort==EnumCampPanelType.M_SEVEN_DAY) 
			{
				return 100003;
			}
			return -sort;
		}
		private var _activityInfos:Vector.<ActivityVo>;
		private var _icon:String;
		
		
		private var _tag:int = 0;
		
		private var _rewardCount:int = 0;
		private var _activityGroupType:int;
		
		public function get SortId():int
		{
			if ( _activityInfos == null || _activityInfos.length == 0 )
				return defaultSortId--;
			return changeSortId(_activityInfos[0].mainPanelType);
		}
		public function ActivityIconExt()
		{
			super();
		}
		override public function canOpen():Boolean
		{
			return true;
		}
		public function setActivityList( infos:Vector.<ActivityVo> ):void
		{
			_activityInfos = infos;
			_activityInfos.sort(sortIcons);
			
			_icon = _activityInfos[0].entranceIcon;
			
			var hasReward:Array = [];
			var getGroup:int = 0;
			for ( var j:int = 0; j < infos.length; j ++ )
			{
				 if ( infos[j].status == 1 && ActivityUtil.needShow( infos[j].activityType ,infos[j].childPanelType) && hasReward.indexOf(infos[j].childPanelType) == -1 )
				{
					 hasReward.push( infos[j].childPanelType );
				}
				
				if ( getGroup != 0 && infos[j].activityGroupType != 0 && getGroup != infos[j].activityGroupType )
					GameLog.addError("分组配置错误，请检查活动主类型：" + infos[j].mainPanelType );
				
				if ( getGroup == 0 && getGroup != infos[j].activityGroupType )
					getGroup = infos[j].activityGroupType;
			}
			
			_rewardCount = hasReward.length;
			updateNums( _rewardCount );
			
			
			if ( getGroup != 0 )
				_activityGroupType = getGroup;
//			else
//				_activityGroupType = EnumTopGroupBtnType.G_TYPE_ACTIVITY;
			
			if( infos[0].entranceIcon )
				this.styleName=infos[0].entranceIcon;
		}

		
		public static function sortIcons(tmp1:ActivityVo, tmp2:ActivityVo):int
		{
			if (tmp1.childPanelType < tmp2.childPanelType)
				return -1;
			else
				return 1;
		}
		override public function clickMe():void
		{
				//todo 这个逻辑莫名其妙，保留，先干了
			if ( goUrl() )
				return;
			
			var thisActivityPan:String = Mgr.activityPanelMgr.getActivityPanelKey(this);
			AppManager.showApp(thisActivityPan,_tag);
			_tag=0;
		}
		public function updateNums( num:int ):void
		{
			setNum(num);
		}
		
		public function getGroupType():int
		{
			// TODO Auto Generated method stub
			return _activityGroupType;
		}
		
		public function getRewardCount():int
		{
			// TODO Auto Generated method stub
			return _rewardCount;
		}
		
		override public function dispose():void
		{
			super.dispose();
			
//			if ( thisActivityPan != null )
//				Mgr.uiMgr.hidePanel( (thisActivityPan as Panel) );
		}
		
		public function set tag(value:int):void
		{
			_tag = value;
		}
		
		public function get icon():String
		{
			return _icon;
		}
		
		public function get topType():int
		{
			if ( _activityInfos == null || _activityInfos.length == 0 )
				return -1;
			return _activityInfos[0].mainPanelType;
		}
		
		public function get titleUrl():String
		{
			if ( _activityInfos == null || _activityInfos.length == 0 )
				return "";
			
			return _activityInfos[0].titleUrl;
		}
		
		private function goUrl():Boolean
		{
			if ( _activityInfos == null || _activityInfos.length == 0 )
				return false;
			
			var str:String = _activityInfos[0].getFlagValue(EnumCampsFlag.F_HTTP_STR);
			if ( str == null || str == "" )
				return false;
			
			GlobalFunction.OpenUrl( str );
			return true;
		}
	}
}


