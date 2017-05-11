package   com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.netData.team.bean.TeamMemberBriefInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.mainui.head.head_min_Skin;



	
	public class TeamBarListItemExt extends SkinUI
	{
		
		private var _data:TeamMemberInfo;
		private var _skin:head_min_Skin;
		private var _headImg:UIAsset;
		private var tipData:Array=["未知","未知",0,0];
		private var buffIcon:Array=[];
		private var _stateImg:UIAsset;
		public function TeamBarListItemExt()
		{
			_skin=new head_min_Skin();
			super(_skin);
			
			_headImg=new UIAsset();
			_headImg.x=10;
			_headImg.y=8;
			_skin.container.addChildAt(_headImg,3);
			var str:String="所在地图：$<br>";
			str+="等级：$<br>"+"气血：$/$";
			TipTargetManager.show(this,TargetTipsMaker.makeSimplePropChangeTextTips(str,tipData));
			Mgr.teamMgr.addEventListener(TeamEvent.TEAM_MEM_ATTR_CHANGE,onTeamAttrChange);
			MCUtil.removeSelf(_skin.role_buffer);
		}	
		private function onTeamAttrChange(event:TeamEvent):void
		{
			if (!_data) 
			{
				return;
			}
			// TODO Auto-generated method stub
			var list:Vector.<TeamMemberBriefInfo>=event.data;
			if (list) 
			{
				for each (var temp:TeamMemberBriefInfo in list) 
				{
					if (_data.memberId.EqualTo(temp.memberId))
					{
						updateDynamic(temp.hp,temp.debufflist);
						break;
					}
				}
				
			}
		}
		public function setData(team:*):void
		{
			this._data=team as TeamMemberInfo;
		
			var job:int=data.appearanceInfo.job;
			_skin.UI_bing.visible=job==JobEnum.ROLE_1_TYPE;
			_skin.UI_yi.visible=job==JobEnum.ROLE_4_TYPE;
			_skin.UI_mo.visible=job==JobEnum.ROLE_2_TYPE||JobEnum.ROLE_3_TYPE;
			
			switch(job){
				case JobEnum.ROLE_1_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_1_SMALL;
					break;
				case JobEnum.ROLE_2_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_2_SMALL;
					break;
				case JobEnum.ROLE_3_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_3_SMALL;
					break;
				case JobEnum.ROLE_4_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_4_SMALL;
					break;
			}
			updateDynamic(_data.maxhp,null);
			_skin.role_name.text=_data.memberName+" ("+data.memberLevel+"级)";
			_skin.qizi.visible=_data.memberId.EqualTo(Mgr.teamMgr.captain.memberId);
			var state:int=Mgr.teamMgr.getNearState(_data.memberId);
			setState(state);
		}
		private function setState(state:int):void
		{
			if (state==0) 
			{
				if (_stateImg) 
				{
					_stateImg.visible=false;
				}
			}
			else
			{
				if (!_stateImg) 
				{
					_stateImg=new UIAsset();
					this.addChild(_stateImg);
				}
				if (state==1) 
				{
					_stateImg.styleName="ui/common/yinzhang.png";
				}
				else
				{
					_stateImg.styleName="ui/common/lixianyinzhang.png";
				}
				_stateImg.visible=true;
			}
		}
		public function updateDynamic(hp:int,buff:Vector.<int>):void
		{
			clearAllBuff();
			var scaleX:Number=hp/_data.maxhp;
			scaleX=scaleX>1?1:scaleX;
			_skin.xuecao_bar.scaleX=scaleX;
			var qMap:Q_map=MapDataManager.getMapInfo( _data.memberMapModelID ).getData() as Q_map;
			tipData[0]=qMap.q_map_name;
			tipData[1]=_data.memberName;
			tipData[2]=hp;
			tipData[3]=_data.maxhp;
			if (buff&&buff.length>0) 
			{
				var len:int=buff.length;
				for (var i:int = 0; i < len; i++) 
				{
					var icon:BgIcon=new BgIcon(IcoSizeEnum.ICON_24);
					icon.setIconResName(ClientConfig.getBuffIcon(BuffStateDataManager.getData(buff[i]).q_icon, IcoSizeEnum.ICON_24 ));
					icon.x=_skin.role_buffer.x+i*26;
					icon.y=_skin.role_buffer.y;
					this.addChild(icon);
					buffIcon.push(icon);
				}
			}
		}
		
		public function get data():TeamMemberInfo
		{
			return _data;
		}
		override public function dispose():void
		{
			super.dispose();
			_data=null;
			TipTargetManager.remove(this);
			Mgr.teamMgr.removeEventListener(TeamEvent.TEAM_MEM_ATTR_CHANGE,onTeamAttrChange);
			clearAllBuff();
		}
		private function clearAllBuff():void
		{
			for each (var icon:BgIcon in buffIcon) 
			{
				MCUtil.removeSelf(icon);
			}
			buffIcon.length=0;
		}
	}
}