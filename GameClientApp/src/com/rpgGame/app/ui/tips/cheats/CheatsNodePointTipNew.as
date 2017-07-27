package  com.rpgGame.app.ui.tips.cheats
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.MeridianMgr;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tips.cheats.TipUrl;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Tips;
	
	public class CheatsNodePointTipNew extends SkinUI implements ITip
	{
		private static var _instance : CheatsNodePointTipNew = null;
		
		public static function get instance() : CheatsNodePointTipNew
		{
			if (!_instance)
			{
				_instance = new CheatsNodePointTipNew();
			}
			return _instance;
		}
		private var _skin:Jingmai_Tips;
		private var labList:Array;
		private var _stoneIcon:UIAsset;
		private var _initStr:String;
		private var _chacheData:*;
		public function CheatsNodePointTipNew()
		{
			_skin=new Jingmai_Tips();
			super(_skin);
		//	MCUtil.removeSelf(_skin.lb_Item0);
			MCUtil.removeSelf(_skin.lb_shengming);
			MCUtil.removeSelf(_skin.lb_dengji);
			_initStr=_skin.lb_Stone.text;
			labList=[];
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
				
				var serverData:CheatsNodeVo=mp.data;
				var qAcu:Q_cheats_node=serverData.getConfig();
				if (!qAcu||!serverData) 
				{
					return;
				}
				if (qAcu.q_type==0) 
				{
					showChongXueTips(serverData,qAcu);
				}
				else
				{
					showJXTips(serverData,qAcu);
				}
			}
			
		}
		private function showChongXueTips(serverData:CheatsNodeVo,qAcu:Q_cheats_node):void
		{
			MCUtil.removeSelf(_skin.imgStone);
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
			if(serverData.curLevel==0)
			{
				this._skin.uiName1.visible=true;
				var canActive:Boolean=Mgr.cheatsMgr.getNodeIsUnlock(serverData);
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
				startY=createCondition(serverData,startY,true);
				this._skin.imgLine2.visible=true;
				this._skin.imgLine2.y=startY;
				startY+=_skin.imgLine2.height+2;
				//激活属性
				startPos=new Point(_skin.lb_shengming.x,startY);
				curAttrId=0;
				//如果是0级显示1级的属性
				if (serverData.curLevel==0) 
				{
					curAttrId=serverData.getAttrIdAtLevel(1);
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
				this._skin.lb_jihuo.text=serverData.curLevel+"/"+CheatsCfg.getCheats(serverData.cheatsId).q_maxlevel+"层";
				var isMax:Boolean=serverData.curLevel>=CheatsCfg.getCheats(serverData.cheatsId).q_maxlevel;
				//不是最高级
				if (!isMax) 
				{
					this._skin.uiName1.styleName=TipUrl.URL_ShengJi_CON;
					this._skin.uiName1.visible=true;
					startY=createCondition(serverData,startY,false);
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
				curAttrId=serverData.getAttrIdAtLevel(serverData.curLevel);
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
					var nextMeriAttr:int=serverData.getAttrIdAtLevel(serverData.curLevel+1);
					if (nextMeriAttr) 
					{
						var qAttNext:Q_att_values=AttValueConfig.getAttInfoById(nextMeriAttr);
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
		private function createCondition(qMer:CheatsNodeVo,startY:int,isUnlockCondion:Boolean):int
		{
			var lb:Label;
			var isOk:Boolean=false;
			//还要判断心法等级
			var nextLevel:int=qMer.curLevel+1;
			if (nextLevel<=qMer.getConfig().q_maxlevel) 
			{
				lb=clonelab(_skin.lb_dengji);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=nextLevel<=Mgr.cheatsMgr.getCheatVo(qMer.cheatsId).level;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?StaticValue.A_UI_GREEN_TEXT:StaticValue.A_UI_RED_TEXT,Mgr.cheatsMgr.getCheatVo(qMer.cheatsId).cheatsConfig.q_name+"等级:"+nextLevel+"重");
				lb.width=lb.textWidth;
			}
			var needLv:int=qMer.levelUpNeedPlayerLevel;
			if (needLv!=0) 
			{
				lb=clonelab(_skin.lb_dengji);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=needLv<=MainRoleManager.actorInfo.totalStat.level;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?StaticValue.A_UI_GREEN_TEXT:StaticValue.A_UI_RED_TEXT,"角色等级:"+needLv+"级");
				lb.width=lb.textWidth;
			}
			var preLv:int=qMer.levelUpNeedPreLv;
			if (preLv!=0) 
			{
				var need:Q_cheats_node=qMer.getPreNodeConfig();
				
				if (need) 
				{
					var tmp:Array=need.q_node_id.split("_");
					var needInfo:CheatsNodeVo=Mgr.cheatsMgr.getCheatNodeVo(tmp[0],tmp[1]);
					lb=clonelab(_skin.lb_dengji);
					this.addChild(lb);
					lb.y=startY;
					startY+=lb.height+2;
					//这里要判断石头类型
					isOk=false;
					var str:String="";
					if (needInfo!=null) 
					{
						//冲穴
						if (need.q_type==0) 
						{
							str=need.q_name+":"+preLv;
							isOk=needInfo.curLevel>=preLv;
						}
						else
						{
							str=need.q_name+":镶嵌"+preLv+"级"+EnumMStoneType.getStoneTypeName(need.q_stone_type);
							if (needInfo.getStone()!=null) 
							{
								var qitem:Q_item=ItemConfig.getQItemByID(needInfo.getStone().itemModelId);
								if (qitem) 
								{
									isOk=qitem.q_levelnum>=preLv;
								}
							}
						}
					}
					
					lb.htmlText=HtmlTextUtil.getTextColor(isOk?StaticValue.A_UI_GREEN_TEXT:StaticValue.A_UI_RED_TEXT,str);
					lb.width=lb.textWidth;
				}
			}
			var needSprit:int=qMer.levelUpNeedSpirit;
			//解锁不消耗
			if (needSprit!=0) 
			{
				lb=clonelab(_skin.lb_dengji);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=needSprit<=MainRoleManager.actorInfo.curZhenqi;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?StaticValue.A_UI_GREEN_TEXT:StaticValue.A_UI_RED_TEXT,"真气消耗:"+needSprit);
				lb.width=lb.textWidth;
			}
			return startY;
		}
		private function showJXTips(serverData:CheatsNodeVo,qAcu:Q_cheats_node):void
		{
			this.addChild(_skin.imgStone);
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
			if (serverData.getStone()==null) 
			{
				
				canActive=Mgr.cheatsMgr.getNodeIsUnlock(serverData);
				if (!canActive) 
				{
					this._skin.lb_jihuo.text="锁定";
					this._skin.lb_jihuo.visible=true;
					//this._skin.uiName1.text="【解锁条件】";
					this._skin.uiName1.styleName=TipUrl.URL_JiHuo_CON;
					startY=createCondition(serverData,startY,true);
				}
				_skin.imgLine2.visible=true;
				_skin.imgLine2.y=startY;
				startY+=_skin.imgLine2.height+2;
				
			}//激活了
			//没镶嵌,不显示镶嵌效果
			var lb:Label;
			if(canActive&&serverData.getStone()==null)
			{
				this._skin.lb_jihuo.text="未镶嵌";
				this._skin.lb_jihuo.visible=true;
				//冲穴
				this._skin.uiName1.visible=false;
				startY=_skin.uiName1.y;
				_skin.imgLine2.visible=false;
			}
			else if(serverData.getStone()!=null)
			{
				startY+=2;
				//图标。
				var qStone:Q_item=ItemConfig.getQItemByID(serverData.getStone().itemModelId);
				stoneIcon.styleName="ui/app/beibao/icons/bianshi/"+qStone.q_default+"/"+qAcu.q_stone_type+".png";
				stoneIcon.x=this._skin.uiName1.x;
				stoneIcon.y=startY;
				this.addChild(stoneIcon);
				labList.push(stoneIcon);
				isMaxStone=qStone.q_levelnum>=MeridianMgr.MAX_STONE_LV;
				//名字
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.color=ItemConfig.getItemQualityColor(serverData.getStone().itemModelId);
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
			_skin.imgStone.y=startY;
			_skin.imgStone.styleName="ui/app/beibao/icons/bianshi/5/"+qAcu.q_stone_type+".png";
			_skin.lb_Stone.y=startY+4;
			_skin.lb_Stone.htmlText=_initStr.replace("$",HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,EnumMStoneType.getStoneTypeName(qAcu.q_stone_type)));
			startY+=Math.max(_skin.lb_Stone.height,_skin.imgStone.height)+2;
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
		
		private function updateTips():void
		{
			setTipData(_chacheData);
		}
		private function removeEvent():void
		{
			//Mgr.cheatsMgr.removeEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,playerAttrChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,playerAttrChange);
		}
		public function get stoneIcon():UIAsset
		{
			if (_stoneIcon==null) 
			{
				_stoneIcon=new UIAsset();
			}
			return _stoneIcon;
		}

	}
}