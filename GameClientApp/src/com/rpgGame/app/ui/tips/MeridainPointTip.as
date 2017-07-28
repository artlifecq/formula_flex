package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.MeridianMgr;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tips.cheats.TipUrl;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Tips;
	
	public class MeridainPointTip extends SkinUI implements ITip
	{
		private static var _instance : MeridainPointTip = null;
		
		public static function get instance() : MeridainPointTip
		{
			if (!_instance)
			{
				_instance = new MeridainPointTip();
			}
			return _instance;
		}
		private var _skin:Jingmai_Tips;
		private var labList:Array;
		private var _stoneIcon:UIAsset;
		private var _initStr:String;
		private var _chacheData:*;
		public function MeridainPointTip()
		{
			_skin=new Jingmai_Tips();
			super(_skin);
		//	MCUtil.removeSelf(_skin.lb_Item0);
			MCUtil.removeSelf(_skin.lb_shengming);
			MCUtil.removeSelf(_skin.lb_dengji);
			_initStr=_skin.lb_Stone.text;
			labList=[];
			Mgr.meridianMgr.addEventListener(MeridianEvent.MERDIAN_UPDATE_TIP,onDataChange);
			_skin.iconbg.addChild(_skin.imgStone);
			_skin.imgStone.x=_skin.imgStone.y=1;
		}
		
		public function setTipData(data:*):void
		{
			addEvent();
			var mp:*=data;
			_chacheData=data;
			if (mp) 
			{
				for each (var lab:* in labList) 
				{
					MCUtil.removeSelf(lab);
					if (lab is IconCDFace) 
					{
						IconCDFace(lab).clear();
					}
				}
				labList.length=0;
				var acuId:String=mp.acupointId;
				var serverData:AcuPointInfo=mp.data;
				var qAcu:Q_meridian=MeridianCfg.getMeridianCfg(acuId);
				if (!qAcu||!serverData) 
				{
					return;
				}
				if (qAcu.q_showtype==0) 
				{
					showChongXueTips(acuId,serverData,qAcu);
				}
				else
				{
					showJXTips(acuId,serverData,qAcu);
				}
				
				//状态 冲穴
			
				
			}
			
		}
		private function showChongXueTips(acuId:String,serverData:AcuPointInfo,qAcu:Q_meridian):void
		{
			MCUtil.removeSelf(_skin.iconbg);
			MCUtil.removeSelf(_skin.lb_Stone);
			//穴位名字
			this._skin.lb_name.text=qAcu.q_name;
			//未激活
			this._skin.lb_jihuo.visible=true;
			this._skin.lb_jihuo.color=GameColorUtil.COLOR_RED;
			var startY:int=this._skin.uiName1.y;
			//this._skin.uiName1.y=startY;
			startY+=this._skin.uiName1.height+2;
			var startPos:Point;
			var curAttrId:int;
			var qAtt:Q_att_values;
			var getTypeValueMap:HashMap;
			var labs:Array;
			//锁定或者未激活
			if(serverData.level==0)
			{
				this._skin.uiName1.visible=true;
				var canActive:Boolean=Mgr.meridianMgr.getCanActive(serverData);
				if (!canActive) 
				{
					this._skin.lb_jihuo.text="锁定";
					//this._skin.uiName1.text="【解锁条件】";
					this._skin.uiName1.styleName=TipUrl.URL_JiHuo_CON;
				}
				else
				{
					//冲穴
					this._skin.lb_jihuo.text="未激活";
				//	this._skin.uiName1.text="【冲穴条件】";
					this._skin.uiName1.styleName=TipUrl.URL_JiHuo_CON;
				}
				//激活条件
				startY=createCondition(qAcu,startY);
				this._skin.imgLine2.visible=true;
				this._skin.imgLine2.y=startY;
				startY+=_skin.imgLine2.height+2;
				//激活属性
				startPos=new Point(_skin.lb_shengming.x,startY);
				curAttrId=qAcu.q_stone_attribute;
				//如果是0级显示1级的属性
				if (serverData.level==0) 
				{
					curAttrId=Mgr.meridianMgr.getNextLevelAcu(serverData).q_stone_attribute;
				}
				if (curAttrId!=0) 
				{
					_skin.uiName2.visible=true;
					_skin.uiName2.y=startY;
					startY+=_skin.uiName2.height+2;
					//属性
					//_skin.uiName2.text=canLevelUp?"【当前属性】":"【冲穴属性】";
					_skin.uiName2.styleName=TipUrl.URL_JiHuo;
					qAtt=AttValueConfig.getAttInfoById(curAttrId);
					if (qAtt) 
					{
						startPos.y=startY;
						getTypeValueMap= AttValueConfig.getTypeValueMap(qAtt);
						labs=AttrUtil.showAttr(getTypeValueMap,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
						labList=labList.concat(labs);
					}
					startY=startPos.y+2;
				}
				
			}
			//激活过了
			else
			{
				//this._skin.uiName1.text="【升级条件】";
				
				this._skin.lb_jihuo.color=GameColorUtil.C_YELLOW;
				this._skin.lb_jihuo.text=serverData.level+"/"+MeridianCfg.getMaxLevel(serverData.MeridId,serverData.acuPointId)+"层";
				var isMax:Boolean=Mgr.meridianMgr.isMaxAcuLevel(serverData);
				//不是最高级
				if (!isMax) 
				{
					this._skin.uiName1.styleName=TipUrl.URL_ShengJi_CON;
					this._skin.uiName1.visible=true;
					startY=createCondition(qAcu,startY);
					this._skin.imgLine2.visible=true;
					this._skin.imgLine2.y=startY;
					startY+=_skin.imgLine2.height+2;
				}
				else
				{
					this._skin.uiName1.visible=false;
					this._skin.imgLine2.visible=false;
					startY=_skin.uiName1.y;
					//
				}
				
				_skin.uiName2.visible=false;
				
				startPos=new Point(_skin.lb_shengming.x,startY);
				curAttrId=qAcu.q_stone_attribute;
				//如果是0级显示1级的属性
				if (serverData.level==0) 
				{
					curAttrId=Mgr.meridianMgr.getNextLevelAcu(serverData).q_stone_attribute;
				}
				if (curAttrId!=0) 
				{
					_skin.uiName2.visible=true;
					_skin.uiName2.y=startY;
					startY+=_skin.uiName2.height+2;
					//属性
					//_skin.uiName2.text=canLevelUp?"【当前属性】":"【冲穴属性】";
					_skin.uiName2.styleName=TipUrl.URL_DangQian;
					qAtt=AttValueConfig.getAttInfoById(curAttrId);
					if (qAtt) 
					{
						startPos.y=startY;
						getTypeValueMap = AttValueConfig.getTypeValueMap(qAtt);
						labs=AttrUtil.showAttr(getTypeValueMap,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
						labList=labList.concat(labs);
					}
					startY=startPos.y+2;
					
				}
				
				//下一阶属性
				if (true) 
				{
					var nextTitle:UIAsset=cloneImg(_skin.uiName2);
					nextTitle.y=startY;
					startY+=nextTitle.height;
					this.addChild(nextTitle);
					nextTitle.styleName=TipUrl.URL_XiaCheng;
					var nextMeri:Q_meridian=Mgr.meridianMgr.getNextLevelAcu(serverData);
					if (nextMeri) 
					{
						var qAttNext:Q_att_values=AttValueConfig.getAttInfoById(nextMeri.q_stone_attribute);
						var nexth:HashMap = AttValueConfig.getTypeValueMap(qAttNext);
						startPos.y=startY;
						var labsn:Array=AttrUtil.showAttr(nexth,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
						labList=labList.concat(labsn);
						startY=startPos.y+2;
					}
					else
					{
						var lb:Label=clonelab(_skin.lb_shengming);
						this.addChild(lb);
						lb.y=startY;
						startY+=lb.height+2;
						lb.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"已满级");
						lb.width=lb.textWidth;
					}
				}
			}
			
			//this._skin.imgBg.height=startY;
		//	this.height=startY;
			_skin.imgBg.height=startY+2;
		}
		private function createCondition(qMer:Q_meridian,startY:int):int
		{
			var lb:Label;
			var isOk:Boolean=false;
			if (qMer.q_need_level!=0) 
			{
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=qMer.q_need_level<=MainRoleManager.actorInfo.totalStat.level;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,"角色等级:"+qMer.q_need_level+"级");
				lb.width=lb.textWidth;
			}
			if (qMer.q_need_meridian_id!=""&&qMer.q_need_meridian_id!=null) 
			{
				var need:Q_meridian=MeridianCfg.getMeridianCfg(qMer.q_need_meridian_id+"_0");
				
				if (need) 
				{
					var tmp:Array=need.q_meridian_id.split("_");
					var needInfo:AcuPointInfo=Mgr.meridianMgr.vo.getMeridianAcuInfo(tmp[0],tmp[1]);
					lb=clonelab(_skin.lb_shengming);
					this.addChild(lb);
					lb.y=startY;
					startY+=lb.height+2;
					//这里要判断石头类型
					isOk=false;
					var str:String="";
					if (needInfo!=null) 
					{
						//冲穴
						if (need.q_showtype==0) 
						{
							str=need.q_name+":"+qMer.q_prelvl+"层";
							isOk=needInfo.level>=need.q_prelvl;
						}
						else
						{
							str=need.q_name+":镶嵌"+qMer.q_prelvl+"级"+EnumMStoneType.getStoneTypeName(need.q_stone_type);
							if (needInfo.stone.length>0) 
							{
								var qitem:Q_item=ItemConfig.getQItemByID(needInfo.stone[0].itemModelId);
								if (qitem) 
								{
									isOk=qitem.q_levelnum>=need.q_prelvl;
								}
							}
						}
					}
					
					lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,str);
					lb.width=lb.textWidth;
				}
			}
			if (qMer.q_need_spirit!=0) 
			{
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=qMer.q_need_spirit<=MainRoleManager.actorInfo.curZhenqi;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,"真气消耗:"+qMer.q_need_spirit);
				lb.width=lb.textWidth;
			}
			return startY;
		}
		private function showJXTips(acuId:String,serverData:AcuPointInfo,qAcu:Q_meridian):void
		{
			this.addChild(_skin.iconbg);
			this.addChild(_skin.lb_Stone);
			//穴位名字
			this._skin.lb_name.text=qAcu.q_name;
			//未激活
			this._skin.lb_jihuo.visible=false;
			this._skin.lb_jihuo.color=GameColorUtil.COLOR_RED;
			var startY:int=this._skin.uiName1.y;
			//this._skin.uiName1.y=startY;
			startY+=this._skin.uiName1.height+2;
			//this._skin.uiName1.text="【砭石效果】";
			this._skin.uiName1.styleName=TipUrl.URL_Stone;
			this._skin.uiName1.visible=true;
			var canActive:Boolean;
			var isMaxStone:Boolean=false;
			//奇穴等级一直为0,判断解锁没有
			if (serverData.stone.length==0) 
			{
				
				canActive=Mgr.meridianMgr.getCanActive(serverData);
				if (!canActive) 
				{
					this._skin.lb_jihuo.text="锁定";
					this._skin.lb_jihuo.visible=true;
					//this._skin.uiName1.text="【解锁条件】";
					this._skin.uiName1.styleName=TipUrl.URL_JiHuo_CON;
					startY=createCondition(qAcu,startY);
				}
				_skin.imgLine2.visible=true;
				_skin.imgLine2.y=startY;
				startY+=_skin.imgLine2.height+2;
				
			}//激活了
			//没镶嵌,不显示镶嵌效果
			var lb:Label;
			if(canActive&&serverData.stone.length==0)
			{
				this._skin.lb_jihuo.text="未镶嵌";
				this._skin.lb_jihuo.visible=true;
				//冲穴
				this._skin.uiName1.visible=false;
				startY=_skin.uiName1.y;
				_skin.imgLine2.visible=false;
			}
			else if(serverData.stone.length>0)
			{
				startY+=2;
				//图标。
				var qStone:Q_item=ItemConfig.getQItemByID(serverData.stone[0].itemModelId);
				_ico.styleName="ui/app/beibao/icons/bianshi/"+qStone.q_default+"/"+qAcu.q_stone_type+".png";
				stoneIcon.x=this._skin.uiName1.x;
				stoneIcon.y=startY;
				this.addChild(stoneIcon);
				labList.push(stoneIcon);
				isMaxStone=qStone.q_levelnum>=MeridianMgr.MAX_STONE_LV;
				//名字
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.color=ItemConfig.getItemQualityColor(serverData.stone[0].itemModelId);
				lb.text=qStone.q_name;
				//lb.text="空";
				lb.x=stoneIcon.x+35;
				lb.y=stoneIcon.y+(stoneIcon.height-lb.height)/2;
				startY+=stoneIcon.height+2;
				//石头属性
				var qAtt:Q_att_values=AttValueConfig.getAttInfoById(qStone.q_att_type);
				var startPos:Point=new Point(lb.x,startY);
				if (qAtt) 
				{
					var nexth:HashMap = AttValueConfig.getTypeValueMap(qAtt);
					var labsn:Array=AttrUtil.showAttr(nexth,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
					labList=labList.concat(labsn);
				}
				startY=startPos.y;
				_skin.imgLine2.visible=true;
				_skin.imgLine2.y=startY;
				startY+=_skin.imgLine2.height+2;
			}
			
			//镶嵌说明
			_skin.uiName2.y=startY;
			_skin.uiName2.visible=true;
			//_skin.uiName2.text="【镶嵌说明】";
			_skin.uiName2.styleName=TipUrl.URL_XiangQian;
			startY+=_skin.uiName2.height+2;
			_skin.iconbg.y=startY;
			_skin.imgStone.styleName="ui/app/beibao/icons/bianshi/5/"+qAcu.q_stone_type+".png";
			_skin.lb_Stone.y=startY+4;
			_skin.lb_Stone.htmlText=_initStr.replace("$",HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,EnumMStoneType.getStoneTypeName(qAcu.q_stone_type)));
			startY+=Math.max(_skin.lb_Stone.height,_skin.iconbg.height)+2;
			//满级
			if (isMaxStone) 
			{
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.color=GameColorUtil.COLOR_YELLOW;
				lb.text="已镶嵌最高等级砭石";
				//lb.text="空";
				lb.x=_skin.uiName1.x;
				lb.y=startY;
				startY+=lb.height+2;
			}
			_skin.imgBg.height=Math.max(106,startY+2);
		}
		
		private function clonelab(lab:Label):Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.name =lab.name;
			temp.letterSpacing = lab.letterSpacing;
			temp.text = lab.text;
			temp.color =lab.color;
			temp.nativeFilters = lab.nativeFilters;
			temp.width = lab.width;
			temp.x = lab.x;
			temp.y = lab.y;
			labList.push(temp);
			return temp;
		}
		private function cloneImg(ui:UIAsset):UIAsset
		{
			var ret:UIAsset=MCUtil.cloneUIAssert(ui);
			labList.push(ret);
			return ret;
		}
		public function hideTips():void
		{
//			if (_stoneIcon) 
//			{
//				_stoneIcon.clear();
//			}
			removeEvent();
		}
		private function addEvent():void
		{
			if (!EventManager.hasEvent(MainPlayerEvent.LEVEL_CHANGE,playerLvChange)) 
			{
				EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,playerLvChange);
				EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,playerLvChange);
			}
		}
		private function playerLvChange(type:int=0):void
		{
			updateTips();
		}
		private function playerAttrChange(type:int=0):void
		{
			if (type==CharAttributeType.LV||type==CharAttributeType.RES_ZHENQI) 
			{
				updateTips();
			}
		}
		protected function onDataChange(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			var data:AcuPointInfo=event.data;
			if (_chacheData&&_chacheData.data) 
			{
				if (_chacheData.data==data) 
				{
					updateTips();
				}
			}
			
		}
		private function updateTips():void
		{
			setTipData(_chacheData);
		}
		private function removeEvent():void
		{
			//Mgr.meridianMgr.removeEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,playerAttrChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,playerAttrChange);
		}
		private var _ico:UIAsset;
		public function get stoneIcon():UIAsset
		{
			if (_stoneIcon==null) 
			{
				_stoneIcon=new UIAsset();
				_stoneIcon.styleName="ui/common/grid/normal/bianshi_icon.png";
				_ico=new UIAsset();
				_ico.x=_ico.y=1;
				_stoneIcon.addChild(_ico);
			}
			return _stoneIcon;
		}

	}
}