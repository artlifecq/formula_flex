package   com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.team.bean.TeamMemberBriefInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.mainui.head.head_min_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class TeamBarListItemExt extends SkinUI
	{
		private var _data:TeamMemberInfo;
		private var _skin:head_min_Skin;
		//		private var _headImg:UIAsset;
		private var tipData:Array=["未知","未知",0,0];
		private var buffIcon:Array=[];
		private var _stateImg:UIAsset;
		public function TeamBarListItemExt()
		{
			_skin=new head_min_Skin();
			super(_skin);
			_skin.skinSelect.visible=false;
			//			_headImg=new UIAsset();
			//			_headImg.x=10;
			//			_headImg.y=8;
			//			_skin.container.addChildAt(_headImg,3);
			var str:String="所在地图：$<br>";
			str+="等级：$<br>"+"气血：$/$";
			TipTargetManager.show(this,TargetTipsMaker.makeSimplePropChangeTextTips(str,tipData));
			Mgr.teamMgr.addEventListener(TeamEvent.TEAM_MEM_ATTR_CHANGE,onTeamAttrChange);
			MCUtil.removeSelf(_skin.role_buffer);
			
		}	
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			var isduizhang:Boolean=Mgr.teamMgr.isCaptain;
			switch (target) {
				case this._skin.btn_more:
					var menus : Array = MenuUtil.getPlayerTeamMenu(_data.memberId.ToGID(), isduizhang);
					MenuManager.showMenu(menus, [_data.memberId, _data.memberName], -1, -1, 80);
					break;
				default:
				{
					onSelectPlayer();
				}
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
		}
		
		private function onView():void
		{
			// TODO Auto Generated method stub
			if (_data) 
			{
				Mgr.teamMgr.loopPlayer(_data.memberName);
			}
		}
		private function onSelectPlayer():void
		{
			if (_data) 
			{
	
				//				else
				//				{
				//					var state:int=Mgr.teamMgr.getNearState(_data.memberId);
				//					if (state==1) 
				//					{
				//						FloatingText.showUp("该玩家离你太远");
				//					}
				//					else if (state==2) 
				//					{
				//						FloatingText.showUp("该玩家已下线");
				//					}
				//				}
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
			//			_skin.btn_cha.visible=!_data.memberId.EqualTo(MainRoleManager.actorInfo.serverID);
			var job:int=data.appearanceInfo.job;
			//			_skin.UI_bing.visible=job==JobEnum.ROLE_1_TYPE;
			//			_skin.UI_yi.visible=job==JobEnum.ROLE_4_TYPE;
			//			_skin.UI_mo.visible=(job==JobEnum.ROLE_2_TYPE)||(job==JobEnum.ROLE_3_TYPE);
			
			switch(job){
				case JobEnum.ROLE_1_TYPE:
					this._skin.icon.styleName = "ui/mainui/head/touxiang/bingjia/small.png";
					break;
				case JobEnum.ROLE_2_TYPE:
					if(data.appearanceInfo.sex==1)
						this._skin.icon.styleName = "ui/mainui/head/touxiang/mojia/small.png";
					else
						this._skin.icon.styleName = "ui/mainui/head/touxiang/mojia2/small.png";
					break;
				case JobEnum.ROLE_3_TYPE:
					this._skin.icon.styleName = "ui/mainui/head/touxiang/mojia2/small.png";
					break;
				case JobEnum.ROLE_4_TYPE:
					this._skin.icon.styleName = "ui/mainui/head/touxiang/yijia/small.png";
					break;
			}
			updateDynamic(_data.maxhp,null);
			_skin.lbLevel.text = data.memberLevel.toString();
			var arr:Array=  _data.memberName.split(']');
			if(arr.length>1)	
				this._skin.role_name.text = arr[1];
			else this._skin.role_name.text =  _data.memberName;
			if(data.memberId.ToGID()==MainRoleManager.serverGid){
				this._skin.btn_more.visible=false;
				this._skin.role_name.color = StaticValue.YELLOW_TEXT;
			}
			else{
				this._skin.btn_more.visible=true;
				this._skin.role_name.color = StaticValue.BEIGE_TEXT;
			}
			_skin.qizi.visible=_data.memberId.EqualTo(Mgr.teamMgr.captain.memberId);
			var state:int=Mgr.teamMgr.getNearState(_data.memberId);
			setState(state);
		}
		private function setState(state:int):void
		{
			if (state==0) 
			{
				this.filter=null;
				if (_stateImg) 
				{
					_stateImg.visible=false;
				}
			}
			else
			{	
				if (state==1) 
				{
					if (!_stateImg) 
					{
						_stateImg=new UIAsset();
						this.addChild(_stateImg);
						_stateImg.x=18;
						_stateImg.y=38;
					}
					_stateImg.styleName="ui/common/yinzhang3.png";
					_stateImg.visible=true;
					this.filter=null;
				}
				else
				{
					if (_stateImg) 
					{
						_stateImg.visible=false;
					}
					GrayFilter.gray(this);
					//GrayFilter.gray(_skin.xuecao_bar);
				}
				
			}
		}
		public function updateDynamic(hp:int,buff:Vector.<int>):void
		{
			clearAllBuff();
			var scaleX:Number=hp/_data.maxhp;
			scaleX=scaleX>1?1:scaleX;
			_skin.xuecao_bar.scaleX=scaleX;
			var mapName:String="离线";
			if (_data.memberMapModelID!=0) 
			{
				var qMap:Q_map=MapDataManager.getMapInfo( _data.memberMapModelID ).getData() as Q_map;
				mapName=qMap.q_map_name+"."+_data.memberMapLine+"线";
			}
			tipData[0]=mapName;
			tipData[1]=_data.memberLevel;
			tipData[2]=hp;
			tipData[3]=_data.maxhp;
			if (buff&&buff.length>0) 
			{
				var len:int=buff.length;
				var index:int = 0;
				for (var i:int = 0; i < len; i++) 
				{
					var q_buff:Q_buff=BuffStateDataManager.getData(buff[i]);
					if(q_buff&&q_buff.q_effect_type==2)
					{
						var icon:BgIcon=new BgIcon(IcoSizeEnum.ICON_16);				
						icon.setIconResName(ClientConfig.getBuffIcon(q_buff.q_icon, IcoSizeEnum.ICON_16 ));
						icon.x=_skin.role_buffer.x+index*26;
						icon.y=_skin.role_buffer.y;
						this.addChild(icon);
						index++;
						var info:Q_tipsinfo=new Q_tipsinfo();
						info.q_describe_tittle=q_buff.q_buff_name;
						info.q_describe=q_buff.q_description;
						
						TipTargetManager.show(icon, TargetTipsMaker.makeTips( TipType.NORMAL_TIP,info));
						buffIcon.push(icon);
					}
					else if(q_buff==null)
					{
						trace("这个BUFF为空了，看看是什么原因······························");
					}
				}
			}
		}
		
		public function onTouchItem(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(this);
			if(!t)
			{
				_skin.skinSelect.visible=false;
				return;
			}
			t=e.getTouch(this,TouchPhase.HOVER);
			if(t)
			{
				_skin.skinSelect.visible=true;
			}
			t=e.getTouch(this,TouchPhase.BEGAN);
			if (t) 
			{
				_skin.icon.scale=0.9;
			}
			t=e.getTouch(this,TouchPhase.ENDED);
			if (t) 
			{
				_skin.icon.scale=1;
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
				TipTargetManager.remove(icon);
			}
			buffIcon.length=0;
		}
	}
}