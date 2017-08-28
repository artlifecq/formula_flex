package   com.rpgGame.appModule.social.team.mediator
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.appModule.social.team.MyTeamPanelExt;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.shejiao.zudui.Zudui_Head;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;


	public class PlayerMediator extends Object
	{
		private static var select:PlayerMediator;
		private var _member:TeamMemberInfo;
		private var _player:Group;
		private var _mainPanel:MyTeamPanelExt;
		
		private var _headTitle:SkinnableContainer;
		private var _labMap:Label;
		private var _imgCon:UIAsset;
		
		public var labNameInitY:int=0;
		public var conInitY:int=0;
		public var gid:int = 0;
		
		private var _toFar:Boolean = false;
		
		private var _roleModel:RoleModelShow;
		private  var isMouseOut : Boolean = true;
		private var scale:Number;
		private var touchImg:Sprite;
		private var _stateImg:UIAsset;
		public function PlayerMediator(player:Group,con:UIAsset,head:SkinnableContainer,map:Label , mainPanel:MyTeamPanelExt,sc:Number)
		{
			super();
			_player = player;
			_mainPanel = mainPanel;
			_imgCon = con;
			_labMap =map;
			_headTitle = head;
			labNameInitY=_headTitle.y;
			conInitY=con.y;
			this.scale=sc;
			
			//_player.touchGroup=true;
			
			touchImg=new Sprite;
			touchImg.addEventListener(TouchEvent.TOUCH, onTouch);
			touchImg.x=0;
			touchImg.y=0;
			//touchImg.styleName="ui/common/tips/tips_di2.png";
			touchImg.graphics.beginFill(0);
			touchImg.graphics.drawRect(0,0,_player.width,_player.height);
			touchImg.graphics.endFill();
//			touchImg.width=_player.width;
//			touchImg.height=_player.height;
			touchImg.alpha=0;
			_player.addChild(touchImg);
		}
		private function onTouch(e:TouchEvent):void
		{
			if (!_member) 
			{
				return;
			}
			if (_member.memberId.EqualTo(MainRoleManager.actorInfo.serverID)) 
			{
				return;
			}
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				OnRollOut();
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				OnRollOver();
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				isMouseOut = false;
				OnPlayerPanel();
				return;
			}
		}
		//private var overEffect:UIEffect2D;
		private function OnRollOut():void
		{
//			if(overEffect != null)
//			{
//				overEffect.Dispose();
//				overEffect = null;
//			}
			SceneRoleSelectManager.mouseOverRole=null;
		}
		private function OnRollOver():void
		{
			if (_roleModel) 
			{
				SceneRoleSelectManager.mouseOverRole=_roleModel.avatar.curRole;
			}
//			if(selectEffect != null)
//				return ;
//			if(overEffect == null)
//			{
//				overEffect = UIEffect2D.Create( 1076 , 0 ,true);
//				overEffect.x = _player.uiWidth * 0.5;
//				overEffect.y = _player.uiHeight * 0.5 + 70;
//				_player.addChildAt( overEffect , 0 );
//			}
		}
	//	private var selectEffect:UIEffect2D;
		private function OnPlayerPanel():void
		{
			
			//Clipboard.generalClipboard.clear();
			//Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,"sssss");
			SceneRoleSelectManager.mouseOverRole=_roleModel.avatar.curRole;
			if(!_member.memberId.EqualTo( MainRoleManager.actorInfo.serverID))
			{
				var showArr:Array=[LangMenu.LOOK_HERO];
				if (Mgr.teamMgr.isCaptain) 
				{
					showArr.push(LangMenu.TRANSFER_THE_CAPTAIN);
					showArr.push(LangMenu.PLEASE_FROM_THE_TEAM);
				}
				showArr.push(LangMenu.MOVE_TO_HERO);
			//	showArr.push(LangMenu.COPY_THE_NAME);
				var y : Number = Stage3DLayerManager.stage.mouseY;
				var x : Number = Stage3DLayerManager.stage.mouseX;
				MenuManager.showMenu(showArr,[_member.memberId,_member.memberName],x,y,70,this._player);
			}
			if(select != null)
				select.RemoveSelectEffect();
			select = this;
			OnRollOut();
			CreateSelectEffect();
		}
		public function RemoveSelectEffect():void
		{
//			if(selectEffect != null)
//			{
//				selectEffect.Dispose();
//				selectEffect = null;
//			}
		}
		private function CreateSelectEffect():void
		{
//			if(selectEffect == null)
//			{
//				selectEffect = UIEffect2D.Create( 1075 , 0 , true );
//				selectEffect.x = _player.uiWidth * 0.5;
//				selectEffect.y = _player.uiHeight * 0.5 + 70;
//				_player.addChildAt( selectEffect , 0 );
//			}
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
					this.player.addChild(_stateImg);
					_stateImg.x=(player.width-93)*0.5;
					_stateImg.y=(player.height-55)*0.5;
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
		public function SetData(member:TeamMemberInfo):void
		{
			clearModel();
			TipTargetManager.remove(this.player);
			_member = member;
			toFar = true;
			if(member != null)
			{
				gid = member.memberId.ToGID();
				(_headTitle.skin as Zudui_Head).lab_name.text=member.memberName+"【"+member.memberLevel+"】";
				var mapName:String="离线";
				if (member.memberMapModelID!=0) 
				{
					var map:Q_map =MapDataManager.getMapInfo( member.memberMapModelID ).getData() as Q_map; 
					mapName=map.q_map_name;
				}
				
				//还需要添加线路
//				UIUtil.connectLabelHtmltext( labMap , ["Lv."+member.memberLevel+" " + ( map != null?map.q_map_name:"") ]);
				var str:String=mapName;
				var isOffline:Boolean=_member.isonline==0&&gid!=MainRoleManager.actorInfo.id;
				if (isOffline) 
				{
					setState(2);
					//str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"(离线)");
					//TipTargetManager.show(this.player,TargetTipsMaker.makeSimpleTextTips(HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"处于离线状态的队员，将不被计入组队经验加成的有效人数")));
					str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,NotifyCfgData.getNotifyTextByID(61041));
					TipTargetManager.show(this.player,TargetTipsMaker.makeSimpleTextTips(HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,NotifyCfgData.getNotifyTextByID(61008))));
				}
				else
				{
					if (member.memberMapModelID!=MapDataManager.currentScene.sceneId) 
					{
						setState(1);
						str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_YELLOW,NotifyCfgData.getNotifyTextByID(61042));
						TipTargetManager.show(this.player,TargetTipsMaker.makeSimpleTextTips(HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,NotifyCfgData.getNotifyTextByID(61009))));
					}
					else
					{
						setState(0);
						toFar=false;
					}
				}
				labMap.htmlText=str;
//				var showModel:PlayerModelVO = new PlayerModelVO( member.appearanceInfo );
				if(_roleModel == null)
				{
					_roleModel=new RoleModelShow();
					this._imgCon.addChild(_roleModel);
					_roleModel.setData(_member.appearanceInfo,scale);
					
				}
				this.visible = true;
				
			}else
			{
				gid = 0;
				this.visible = false;
				toFar = true;
				setState(0);
			}
		}
		
		public function get visible():Boolean
		{
			return _player.visible;
		}

		public function set visible(value:Boolean):void
		{
			_player.visible = value;
		}

		public function get member():TeamMemberInfo
		{
			return _member;
		}

		public function get toFar():Boolean
		{
			return _toFar;
		}

		public function set toFar(value:Boolean):void
		{
			_toFar = value;
			if(member != null)
			{
			//	var map:Q_map =MapDataManager.getMapInfo( member.memberMapModelID ).getData() as Q_map;
				if(_toFar)
				{
					//imgCon.filter = FilterUtil.getGrayFilter();
					
					TipTargetManager.show(_imgCon,TargetTipsMaker.makeSimpleTextTips(HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,NotifyCfgData.getNotifyTextByID(61010))));
				}else
				{
					//imgCon.filter=null;
					
					TipTargetManager.remove(_imgCon);
				}
			}
		}

		public function get player():Group
		{
			return _player;
		}

		public function get headTitle():SkinnableContainer
		{
			return _headTitle;
		}

		public function get labMap():Label
		{
			return _labMap;
		}

		public function get imgCon():UIAsset
		{
			return _imgCon;
		}


		public function clearModel():void
		{
			// TODO Auto Generated method stub
			if (_roleModel) 
			{
				_roleModel.dispose();
				MCUtil.removeSelf(_roleModel);
				_roleModel=null;
			}
			_member=null;
		}
	}
}