package  com.rpgGame.app.ui.tips.cheats
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.CheatsEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.Xinfa.Xinfa_Tips;

	
	public class CheatsNodePointTip extends SkinUI implements ITip
	{
		private static var _instance : CheatsNodePointTip = null;
		
		public static function get instance() : CheatsNodePointTip
		{
			if (!_instance)
			{
				_instance = new CheatsNodePointTip();
			}
			return _instance;
		}
		private var _skin:Xinfa_Tips;
		private var labList:Array;
		private var _stoneIcon:BgIcon;
		private var _initStr:String;
		private var _chacheData:*;
		public function CheatsNodePointTip()
		{
			_skin=new Xinfa_Tips();
			super(_skin);
			MCUtil.removeSelf(_skin.lab_condition);
			_initStr=_skin.lb_Stone.text;
			labList=[];
			Mgr.cheatsMgr.addEventListener(CheatsEvent.CHEATS_NODE_TIP_CHANGE,onDataChange);
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
				
				//状态 冲穴
			
				
			}
			
		}
		private function showChongXueTips(serverData:CheatsNodeVo,qAcu:Q_cheats_node):void
		{
			MCUtil.removeSelf(_skin.imgStone);
			MCUtil.removeSelf(_skin.lb_Stone);
			//穴位名字
			this._skin.lb_name.text=qAcu.q_name;
			var cheatsVo:CheatsVo=Mgr.cheatsMgr.getCheatVo(serverData.cheatsId);
			//未激活
			this._skin.lb_jihuo.text=serverData.curLevel+"/"+serverData.getConfig().q_maxlevel;
			this._skin.lb_jihuo.visible=true;
			var startY:int=40;
			this._skin.lb_title1.y=startY;
			startY+=this._skin.lb_title1.height+2;
			var isUnlock:Boolean=true;
			this._skin.lb_title1.text="【升级条件】";
			if(serverData.curLevel==0)
			{
				
				isUnlock=Mgr.cheatsMgr.getNodeIsUnlock(serverData);
				if (!isUnlock) 
				{
					this._skin.lb_jihuo.text="锁定";
					this._skin.lb_title1.text="【解锁条件】";
				}
			}
			
			var isMax:Boolean=serverData.curLevel>=cheatsVo.cheatsConfig.q_maxlevel;
			//不是最高级,或者没解锁
			if (!isMax||!isUnlock) 
			{
				startY=createCondition(serverData,startY,!isUnlock);
			}
			else
			{
				var lb:Label=clonelab(_skin.lab_condition);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				lb.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"已达到最高层");
				lb.width=lb.textWidth;
				//
			}
			this._skin.imgLine.y=startY;
			startY+=_skin.imgLine.height+2;
			var canLevelUp:Boolean=Mgr.cheatsMgr.getCanLevelUp(serverData);
			_skin.lb_tile2.visible=false;
			
			var startPos:Point=new Point(_skin.lab_condition.x,startY);
			var curAttrId:int=serverData.getAttrIdAtLevel(serverData.curLevel);
			//如果是0级显示1级的属性
			if (serverData.curLevel==0&&!isUnlock) 
			{
				curAttrId=serverData.getAttrIdAtLevel(1);
			}
			if (curAttrId!=0) 
			{
				_skin.lb_tile2.visible=true;
				_skin.lb_tile2.y=startY;
				startY+=_skin.lb_tile2.height+2;
				//属性
				_skin.lb_tile2.text=canLevelUp||serverData.curLevel>0?"【当前属性】":"【解锁属性】";
				var qAtt:Q_att_values=AttValueConfig.getAttInfoById(curAttrId);
				if (qAtt) 
				{
					startPos.y=startY;
					var getTypeValueMap:HashMap = AttValueConfig.getTypeValueMap(qAtt);
					var labs:Array=AttrUtil.showAttr(getTypeValueMap,this,_skin.lab_condition,1,startPos,0,_skin.lab_condition.height+2);
					labList=labList.concat(labs);
				}
				startY=startPos.y+2;
				
			}
			//下一阶属性
			if (!isMax&&isUnlock) 
			{
				var nextTitle:Label=clonelab(_skin.lb_tile2);
				nextTitle.y=startY;
				startY+=nextTitle.height;
				this.addChild(nextTitle);
				nextTitle.text="【下层提升】";
				var nextAttrId:int=serverData.getAttrIdAtLevel(serverData.curLevel+1);
				if (nextAttrId!=0) 
				{
					var qAttNext:Q_att_values=AttValueConfig.getAttInfoById(nextAttrId);
					var nexth:HashMap = AttValueConfig.getTypeValueMap(qAttNext).clone();
					var nowHash:HashMap=new HashMap();
					serverData.getAttrHash(nowHash);
					HashMap.subtractionValueHashMap(nexth,nowHash);
					startPos.y=startY;
					var labsn:Array=AttrUtil.showDiffAttr(nexth,this,_skin.lab_condition,1,startPos,_skin.lab_condition.width,_skin.lab_condition.height+2);
					labList=labList.concat(labsn);
					startY=startPos.y+2;
				}
				else
				{
					lb=clonelab(_skin.lab_condition);
					this.addChild(lb);
					lb.text="无";
					lb.y=startY;
					startY+=lb.height+2;
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
				lb=clonelab(_skin.lab_condition);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=nextLevel<=Mgr.cheatsMgr.getCheatVo(qMer.cheatsId).level;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,Mgr.cheatsMgr.getCheatVo(qMer.cheatsId).cheatsConfig.q_name+"等级:"+nextLevel+"重");
				lb.width=lb.textWidth;
			}
			var needLv:int=qMer.levelUpNeedPlayerLevel;
			if (needLv!=0) 
			{
				lb=clonelab(_skin.lab_condition);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=needLv<=MainRoleManager.actorInfo.totalStat.level;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,"角色等级:"+needLv+"级");
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
					lb=clonelab(_skin.lab_condition);
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
					
					lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,str);
					lb.width=lb.textWidth;
				}
			}
			var needSprit:int=qMer.levelUpNeedSpirit;
			//解锁不消耗
			if (needSprit!=0&&!isUnlockCondion) 
			{
				lb=clonelab(_skin.lab_condition);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=needSprit<=MainRoleManager.actorInfo.curZhenqi;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,"真气消耗:"+needSprit);
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
			var startY:int=40;
			this._skin.lb_title1.y=startY;
			startY+=this._skin.lb_title1.height+2;
			this._skin.lb_title1.text="【砭石效果】";
			var unLock:Boolean;
			//奇穴等级一直为0,判断解锁没有
			if (serverData.getStone()==null) 
			{
				this._skin.lb_jihuo.visible=true;
				unLock=Mgr.cheatsMgr.getNodeIsUnlock(serverData);
				if (!unLock) 
				{
					this._skin.lb_jihuo.text="锁定";
					this._skin.lb_title1.text="【解锁条件】";
					startY=createCondition(serverData,startY,true);
				}
				
				
			}//激活了
			//没镶嵌
			var lb:Label;
			if(unLock&&serverData.getStone()==null)
			{
				//冲穴
				this._skin.lb_jihuo.text="未镶嵌";
				this._skin.lb_jihuo.visible=true;
				lb=clonelab(_skin.lab_condition);
				this.addChild(lb);
				lb.text="空";
				lb.y=startY;
				startY+=lb.height+2;
			}
			else if(serverData.getStone()!=null)
			{
				//图标。
				var citemInfo:ClientItemInfo=new ClientItemInfo(serverData.getStone().itemModelId);
				citemInfo.cfgId=serverData.getStone().itemModelId;
				citemInfo.itemInfo=serverData.getStone();
				stoneIcon.setIconResName(ClientConfig.getItemIcon(citemInfo.qItem.q_icon.toString(),IcoSizeEnum.ICON_48));
				stoneIcon.x=this._skin.lb_title1.x;
				stoneIcon.y=startY;
				this.addChild(stoneIcon);
				labList.push(stoneIcon);
				
				//名字
				lb=clonelab(_skin.lab_condition);
				this.addChild(lb);
				lb.color=ItemConfig.getItemQualityColor(citemInfo.cfgId);
				lb.text=citemInfo.qItem.q_name;
				//lb.text="空";
				lb.x=stoneIcon.x+stoneIcon.width+2;
				lb.y=stoneIcon.y+(stoneIcon.height-lb.height)/2;
				startY+=stoneIcon.height+2;
				//石头属性
				var qAtt:Q_att_values=AttValueConfig.getAttInfoById(citemInfo.qItem.q_att_type);
				var startPos:Point=new Point(lb.x,startY);
				if (qAtt) 
				{
					var nexth:HashMap = AttValueConfig.getTypeValueMap(qAtt);
					var labsn:Array=AttrUtil.showAttr(nexth,this,_skin.lab_condition,1,startPos,_skin.lab_condition.width,_skin.lab_condition.height+2);
					labList=labList.concat(labsn);
				}
				startY=startPos.y;
			}
			_skin.imgLine.y=startY;
			startY+=_skin.imgLine.height+2;
			//镶嵌说明
			_skin.lb_tile2.y=startY;
			_skin.lb_tile2.visible=true;
			_skin.lb_tile2.text="【镶嵌说明】";
			startY+=_skin.lb_tile2.height+2;
			_skin.imgStone.y=startY;
			
			_skin.lb_Stone.y=startY;
			_skin.lb_Stone.htmlText=_initStr.replace("@",HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,EnumMStoneType.getStoneTypeName(qAcu.q_stone_type)));
			startY+=_skin.lb_Stone.height;
			_skin.imgBg.height=startY+2;
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
		private function playerAttrChange(type:int=0):void
		{
			if (type==CharAttributeType.LV||type==CharAttributeType.RES_ZHENQI) 
			{
				updateTips();
			}
		}
		private function playerLvChange(type:int=0):void
		{
			updateTips();
		}
		protected function onDataChange(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			var data:CheatsNodeVo=event.data;
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
			//Mgr.cheatsMgr.removeEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,playerAttrChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,playerAttrChange);
		}
		public function get stoneIcon():BgIcon
		{
			if (_stoneIcon==null) 
			{
				_stoneIcon=new BgIcon(IcoSizeEnum.ICON_48);
			}
			return _stoneIcon;
		}

	}
}