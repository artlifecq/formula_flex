package com.rpgGame.appModule.junjie
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.JunJieSender;
	import com.rpgGame.app.ui.AttChangeView;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.core.events.JunJieEvent;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.AttChangeEnum;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.coreData.utils.JunJieUtil;
	
	import flash.geom.Point;
	
	import away3d.events.Event;
	
	import feathers.utils.filter.GrayFilter;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.junjie.JunJie_Skin;
	
	public class JunJiePanelExt extends AttChangeView
	{
		private var _skin:JunJie_Skin;
		
		private var _maxShowNum:int=5;
		private var _pointXArr:Array;
		private var _showFirstLv:int=0;
		private var _junjieItemList:Vector.<JunJieItem>;
		private var _huangqinguoqiItem:JunJieItem;
		private var _nowSelectItem:JunJieItem;
		private var _nowShowLevel:int=0;
		
		private var _shuxingItemList:Vector.<ShuXingItem>;
		private var _tiaojianItemList:Vector.<TiaoJianItem>;
		
		private var _avatar : InterAvatar3D;
		private var _avatarData : RoleData;
		private var _avatarContainer:Inter3DContainer;
		
		private var _chenhaoEftContaner:Inter3DContainer;
		private var _chenhaoEft:InterObject3D;
		
		private var changeList:Array;
		
		public function JunJiePanelExt()
		{
			attChangeTypes=[AttChangeEnum.JUNJIE];
			_skin=new JunJie_Skin();
			_junjieItemList=new Vector.<JunJieItem>();
			_shuxingItemList=new Vector.<ShuXingItem>();
			_tiaojianItemList=new Vector.<TiaoJianItem>();
			_avatarContainer=new Inter3DContainer();
			_chenhaoEftContaner=new Inter3DContainer();
			super(_skin);
			_skin.roleCont.addChild(_avatarContainer);
			_skin.roleCont.addChild(_chenhaoEftContaner);
			_pointXArr=[70,51,37,34,34];
			initView();
			initAvatar();
			_skin.conTiaojian.x=_skin.conTiaojian.x-14;
			//			_skin.uiUp.visible=false;
			_skin.num_lv.visible=false;		
			addNode(RTNodeID.JJ,RTNodeID.JJ_BTN_ACTIVE,_skin.btnJihuo,177,null);
		}
		
		private function initView():void
		{
			_huangqinguoqiItem=new JunJieItem();
			_huangqinguoqiItem.setInitPoint(37,434);
			_huangqinguoqiItem.setData(JunJieData.getMaxLv());
			_skin.container.addChild(_huangqinguoqiItem);
			var item:JunJieItem;
			var shuxingItem:ShuXingItem;
			var tiaojianItem:TiaoJianItem;
			var initX:int=0;
			var initY:int=99;
			for(var i:int=0;i<_maxShowNum;i++)
			{
				initX=parseInt(_pointXArr[(i)]);
				item=new JunJieItem();
				item.setInitPoint(initX,initY);
				_junjieItemList.push(item);
				_skin.container.addChild(item);
				initY+=62;
				
				shuxingItem=new ShuXingItem();
				shuxingItem.x=0;
				shuxingItem.y=i*(shuxingItem.height+4);
				_shuxingItemList.push(shuxingItem);
				_skin.contShuxing.addChild(shuxingItem);
				
				tiaojianItem=new TiaoJianItem();
				tiaojianItem.x=15;
				tiaojianItem.y=i*(tiaojianItem.height+4);
				_tiaojianItemList.push(tiaojianItem);
				_skin.conTiaojian.addChild(tiaojianItem);
			}	
		}	
		
		private function initAvatar():void
		{
			_avatar=new InterAvatar3D();
			_avatar.x = 120;
			_avatar.y =380;
			_avatarContainer.addChild3D(_avatar);
			_avatarData=new RoleData(0);
			
			this._avatarData.avatarInfo.setBodyResID(MainRoleManager.actorInfo.avatarInfo.bodyResID, MainRoleManager.actorInfo.avatarInfo.bodyAnimatResID);
			this._avatarData.avatarInfo.hairResID = MainRoleManager.actorInfo.avatarInfo.hairResID;
			this._avatarData.avatarInfo.weaponResID = MainRoleManager.actorInfo.avatarInfo.weaponResID;
			this._avatarData.avatarInfo.weaponEffectID = MainRoleManager.actorInfo.avatarInfo.weaponEffectID;
			this._avatarData.avatarInfo.weaponEffectScale = MainRoleManager.actorInfo.avatarInfo.weaponEffectScale;
			this._avatarData.avatarInfo.deputyWeaponResID = MainRoleManager.actorInfo.avatarInfo.deputyWeaponResID;
			this._avatarData.avatarInfo.deputyWeaponEffectID=MainRoleManager.actorInfo.avatarInfo.deputyWeaponEffectID;
			this._avatarData.avatarInfo.deputyWeaponEffectScale=MainRoleManager.actorInfo.avatarInfo.deputyWeaponEffectScale;
			this._avatar.setRoleData(this._avatarData);
			this._avatar.curRole.setScale(1.5);	
			this._avatar.curRole.stateMachine.transition(RoleStateType.ACTION_SHOW);
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			initEvent();
			showNowJunJieLvAtt();
			//			_showFirstLv=1;
			//			updateBtnState();
			//			showItemList(_showFirstLv);
			//			SelectHandler(_junjieItemList[0]);	
			showBtn();
		}
		
		private function showBtn():void
		{
			if(JunJieData.getMaxLv()-1>Mgr.junjieMgr.getActivationLv())
			{
				
				_showFirstLv=(Mgr.junjieMgr.getActivationLv()+1);
				if(_showFirstLv<_maxShowNum-1){
					_showFirstLv=1;
				}
				else{
					_showFirstLv=_showFirstLv-(_maxShowNum-3);
				}
				updateBtnState();
				showItemList(_showFirstLv);
				var index:int=getIndex();
				SelectHandler(_junjieItemList[index]);	
			}
			else
			{
				_showFirstLv=1;
				updateBtnState();
				showItemList(_showFirstLv);
				SelectHandler(_huangqinguoqiItem);
			}
		}
		
		private function getIndex():int
		{
			var lv:int=(Mgr.junjieMgr.getActivationLv()+1);
			if(_junjieItemList==null||_junjieItemList.length==0) return 0;
			for(var i:int=0;i<_junjieItemList.length;i++)
			{
				if(lv==_junjieItemList[i].lv)
					return i;
			}
			return 0;		
		}
		
		override public function hide():void
		{
			super.hide();
			closeEvent();
			if(_nowSelectItem!=null)
			{
				_nowSelectItem.setBtnState(false);
			}
			_nowSelectItem=null;
			_nowShowLevel=0;
		}
		
		private function initEvent():void
		{
			_skin.btnPrev.addEventListener(Event.TRIGGERED,upHandler);
			_skin.btnNext.addEventListener(Event.TRIGGERED,downHandler);
			_skin.btnJihuo.addEventListener(Event.TRIGGERED,jihuoHandler);
			
			EventManager.addEvent(JunJieEvent.JUNJIE_CHANGE,updateWanChengDuShow);
			EventManager.addEvent(JunJieEvent.JUNJIE_JIEGUO,updatePower);
			EventManager.addEvent(JunJieEvent.JUNJIE_SELECT,SelectHandler);
		}
		
		private function closeEvent():void
		{
			_skin.btnPrev.removeEventListener(Event.TRIGGERED,upHandler);
			_skin.btnNext.removeEventListener(Event.TRIGGERED,downHandler);
			_skin.btnJihuo.removeEventListener(Event.TRIGGERED,jihuoHandler);
			
			EventManager.removeEvent(JunJieEvent.JUNJIE_CHANGE,updateWanChengDuShow);
			EventManager.removeEvent(JunJieEvent.JUNJIE_JIEGUO,updatePower);
			EventManager.removeEvent(JunJieEvent.JUNJIE_SELECT,SelectHandler);
		}
		
		//显示当前的军阶加成
		private function showNowJunJieLvAtt():void
		{
			var nowLv:int=Mgr.junjieMgr.getActivationLv();
			var has:HashMap=JunJieUtil.getShuXingJiaCheng(nowLv);
			var keys:Array=has.keys();
			var values:Array=has.values();
			for(var i:int=0;i<_shuxingItemList.length;i++)
			{
				if(i<keys.length)
				{
					_shuxingItemList[i].setData(nowLv,keys[i],values[i]);
					_shuxingItemList[i].visible=true;
				}
				else
				{
					_shuxingItemList[i].visible=false;
				}
			}
			
			updatePower(false);
		}
		
		//战斗力显示及刷新
		private function updatePower(bool:Boolean):void
		{
			if(bool)
			{
				//更新掉		
				showBtn();
				this.playInter3DAt(ClientConfig.getEffect("ui_jinengjinjiechenggong"),_skin.point_eff.x,_skin.point_eff.y,1);
//				UIPopManager.showAlonePopUI(CenterEftPop,"ui_shengjichenggong");
				var nowFight:int=Mgr.junjieMgr.power;
				var change:int=nowFight-_skin.NumZhanli.number;
				changeList=getChangeList(change);		
				var  timeLine : TimelineLite = new TimelineLite();
				for(var i:int=0;i<changeList.length;i++){
					timeLine.append(TweenLite.delayedCall(0.1,delayTween,[changeList[i]]));
				}					
			}
			else
			{
				_skin.NumZhanli.number=Mgr.junjieMgr.power;
			}
		}
		
		private function delayTween(v:int):void
		{
			_skin.NumZhanli.number=v;
		}
		
		private function getChangeList(changeV:int):Array
		{
			var v:int=	Math.abs(changeV);
			var per:int;
			var i:int=5;
			while(i>0){
				per=Math.floor(v/i);
				if(per!=0){
					break;
				}
				i--;
			}
			if(changeV<0){
				per*=-1;
			}
			
			var num:int=i+1;
			var list:Array=[];
			for(i=1;i<num;i++){
				list.push(_skin.NumZhanli.number+i*per);
			}
			return list;
		}
		
		//刷新条件完成度
		private function updateWanChengDuShow():void
		{
			updateJunJieItemList();
			updateTiaoJianLiet();
			if(_nowSelectItem!=null)
			{
				_nowSelectItem.info=Mgr.junjieMgr.getInfoById(_nowSelectItem.info.modelId);
			}
			if(_nowSelectItem.info.state==0){
				GrayFilter.gray(_skin.btnJihuo);
				_skin.btnJihuo.visible=true;
				_skin.lb_wanchengdu.visible=true;
				setRTNState(RTNodeID.JJ_BTN_ACTIVE,false);
			}
			else if(_nowSelectItem.info.state==1){
				_skin.btnJihuo.filter=null;
				_skin.btnJihuo.visible=true;
				_skin.lb_wanchengdu.visible=true;
				setRTNState(RTNodeID.JJ_BTN_ACTIVE,true);
			}
			else
			{
				_skin.btnJihuo.visible=false;
				_skin.lb_wanchengdu.visible=false;
				setRTNState(RTNodeID.JJ_BTN_ACTIVE,false);
			}		
			var _wanchengnum:int=0;
			for(var i:int=0;i<_tiaojianItemList.length;i++)
			{
				if(_tiaojianItemList[i].iswancheng)
					_wanchengnum++;			
			}
			_skin.lbTiaojian.text="("+_wanchengnum+"/"+_maxShowNum+")";
			_skin.lb_wanchengdu.htmlText=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"进阶目标完成度")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,_wanchengnum+"/"+_maxShowNum);
		}
		
		//刷新选项列表
		private function updateJunJieItemList():void
		{
			if(_junjieItemList==null||_junjieItemList.length<=0) return;
			for(var i:int=0;i<_junjieItemList.length;i++)
			{
				_junjieItemList[i].updateInfo();
			}
		}
		
		//刷新条件列表
		private function updateTiaoJianLiet():void
		{
			if(_tiaojianItemList==null||_tiaojianItemList.length<=0) return;
			for(var i:int=0;i<_tiaojianItemList.length;i++)
			{
				_tiaojianItemList[i].updateInfo();
			}
		}
		
		//显示选项列表 
		private function showItemList(lv:int):void
		{
			var list:Vector.<int>=JunJieData.getShowItemList(lv,_maxShowNum);
			if(list==null||list.length<=0)
			{
				trace("军阶---------提取数据错误");
				return;
			}
			for(var i:int=0;i<_junjieItemList.length;i++)
			{
				if(i<list.length)
				{
					_junjieItemList[i].setData(list[i]);
					_junjieItemList[i].visible=true;
				}
				else
				{
					_junjieItemList[i].visible=false;
				}
			}
		}
		
		//显示选择的某一项的详细信息
		private function showSelectItem():void
		{
			//展示称号
			if(_chenhaoEft!=null)
			{
				_chenhaoEft.dispose();
			}
			var effName:String=JunJieData.getEffById(_nowSelectItem.info.modelId);
			_chenhaoEft=_chenhaoEftContaner.playInter3DAt(ClientConfig.getEffect(effName),120,50,0);
			showTiaoJian();	
			contrastAttr();		
			updateWanChengDuShow();
			
		}
		
		//比对属性
		public function contrastAttr():void
		{
			var has:HashMap=JunJieUtil.getShuXingJiaCheng(_nowSelectItem.lv);
			var pow:int=FightValueUtil.calFightPowerByHash(has,MainRoleManager.actorInfo.job);
			if(_nowSelectItem.lv>Mgr.junjieMgr.getActivationLv()&&pow>0){
				_skin.num_lv.label="x"+pow;
				_skin.num_lv.visible=true;
				//				_skin.uiUp.visible=true;
			}else{
				_skin.num_lv.visible=false;
				//				_skin.uiUp.visible=false;
			}
			for(var i:int=0;i<_shuxingItemList.length;i++)
			{
				_shuxingItemList[i].contrastAttr(_nowSelectItem.lv);
			}
		}
		
		//显示条件
		public function showTiaoJian():void
		{
			for(var i:int=0;i<_tiaojianItemList.length;i++)
			{
				if(i<_nowSelectItem.info.junJieConditionInfos.length)
				{
					_tiaojianItemList[i].setData(_nowSelectItem.lv,_nowSelectItem.info.junJieConditionInfos[i]);
					_tiaojianItemList[i].visible=true;
				}
				else
				{
					_tiaojianItemList[i].visible=false;
				}
			}
		}	
		
		private function updateBtnState():void
		{
			if(_junjieItemList==null||_junjieItemList.length<=0)
			{
				_skin.btnPrev.visible=false;
				_skin.btnNext.visible=false;
				return;
			}
			if(_showFirstLv==1) _skin.btnPrev.visible=false;
			else  _skin.btnPrev.visible=true;
			if(_showFirstLv+_maxShowNum>=JunJieData.getMaxLv()) _skin.btnNext.visible=false;
			else _skin.btnNext.visible=true;
		}
		
		//修正列表选取项
		private function updateItemShow():void
		{
			if(_nowShowLevel!=0)
			{
				if(_nowSelectItem.info.modelId!=_nowShowLevel) _nowSelectItem.setBtnState(false);
				for(var i:int=0;i<_junjieItemList.length;i++)
				{
					if(_nowShowLevel==_junjieItemList[i].info.modelId)
					{
						_nowSelectItem=_junjieItemList[i];
						_nowSelectItem.setBtnState(true);
					}
				}
			}
		}
		
		private function upHandler(e:Event):void
		{
			if(_showFirstLv>1)
			{
				_showFirstLv--;
				updateBtnState();
				showItemList(_showFirstLv);
				updateItemShow();
			}
		}
		
		private function downHandler(e:Event):void
		{
			if(_showFirstLv<=JunJieData.getMaxLv()-_maxShowNum)
			{
				_showFirstLv++;
				updateBtnState();
				showItemList(_showFirstLv);
				updateItemShow();
			}
		}
		
		private function jihuoHandler(e:Event):void
		{
			if(_nowSelectItem.info.state==0)
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(19));
				return;
			}
			else if(_nowSelectItem.info.state==1)
			{
				var p:Point=new Point(this._skin.btnJihuo.x+this._skin.btnJihuo.width/2,this._skin.btnJihuo.y+this._skin.btnJihuo.height/2);
				p=this._skin.btnJihuo.parent.localToGlobal(p);
				p=this._skin.container.globalToLocal(p);
				this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
				JunJieSender.upCSJunJieActivateMessage(_nowSelectItem.lv);
			}
		}
		
		private function addComplete(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		private function SelectHandler(item:JunJieItem):void
		{
			if(_nowSelectItem==null)
			{
				_nowSelectItem=item;
				_nowSelectItem.setBtnState(true);
			}
			else
			{
				_nowSelectItem.setBtnState(false);
				_nowSelectItem=item;
				_nowSelectItem.setBtnState(true);
			}
			
			_nowShowLevel=_nowSelectItem.info.modelId;
			showSelectItem();
		}	
	}
}