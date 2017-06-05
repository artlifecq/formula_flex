package   com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.netData.team.bean.TeamMemberBriefInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.head.head_min_Skin;
	
	import starling.display.DisplayObject;
	
	
	
	
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
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btn_cha:
				{
					onView();
					break;
				}
					
				default:
				{
					onSelectPlayer();
					break;
				}
			}
		}
		private function onView():void
		{
			// TODO Auto Generated method stub
			if (_data) 
			{
				Mgr.teamMgr.loopPlayer(_data.memberId);
			}
		}
		private function onSelectPlayer():void
		{
			if (_data) 
			{
				var role:SceneRole=SceneManager.getSceneObjByID(_data.memberId.ToGID()) as SceneRole;
				if (role) 
				{
					if (role!=SceneRoleSelectManager.selectedRole) 
					{
						SceneRoleSelectManager.selectedRole=role;
					}
				}
				else
				{
					var state:int=Mgr.teamMgr.getNearState(_data.memberId);
					if (state==1) 
					{
						FloatingText.showUp("该玩家离你太远");
					}
					else if (state==2) 
					{
						FloatingText.showUp("该玩家已下线");
					}
				}
			}
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
			_skin.btn_cha.visible=!_data.memberId.EqualTo(MainRoleManager.actorInfo.serverID);
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
					var q_buff:Q_buff=BuffStateDataManager.getData(buff[i]);
					if(q_buff.q_effect_type==2)
					{
						var icon:BgIcon=new BgIcon(IcoSizeEnum.ICON_24);				
						icon.setIconResName(ClientConfig.getBuffIcon(q_buff.q_icon, IcoSizeEnum.ICON_24 ));
						icon.x=_skin.role_buffer.x+i*26;
						icon.y=_skin.role_buffer.y;
						this.addChild(icon);
						buffIcon.push(icon);
					}
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
		public function clearData():void
		{
			_data=null;
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