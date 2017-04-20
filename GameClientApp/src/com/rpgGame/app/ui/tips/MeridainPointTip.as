package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.BaseIcon;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.text.Fontter;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Tips;
	
	import starling.display.DisplayObject;
	
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
		private var _stoneIcon:IconCDFace;
		private var _initStr:String;
		public function MeridainPointTip()
		{
			_skin=new Jingmai_Tips();
			super(_skin);
			MCUtil.removeSelf(_skin.lb_Item0);
			MCUtil.removeSelf(_skin.lb_shengming);
			MCUtil.removeSelf(_skin.lb_dengji);
			_initStr=_skin.lb_Stone.text;
			labList=[];
		}
		
		public function setTipData(data:*):void
		{
			var mp:*=data;
			if (mp) 
			{
				for each (var lab:* in labList) 
				{
					MCUtil.removeSelf(lab);
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
			MCUtil.removeSelf(_skin.imgStone);
			MCUtil.removeSelf(_skin.lb_Stone);
			//穴位名字
			this._skin.lb_name.text=qAcu.q_name;
			//未激活
			this._skin.lb_jihuo.visible=false;
			var startY:int=_skin.lb_Item0.y;
			if (serverData.level==-1) 
			{
				this._skin.lb_jihuo.text="未激活";
				this._skin.lb_jihuo.visible=true;
				
				this._skin.lb_title1.text="【激活条件】";
				var qActive:Q_meridian=MeridianCfg.getMeridianCfg(serverData.MeridId+"_"+serverData.acuPointId+"_0");
				
				if (qActive) 
				{
					startY=createCondition(qActive,startY);
				}
				
			}//激活了
			else if(serverData.level==0)
			{
				//冲穴
				this._skin.lb_jihuo.text="未冲穴";
				this._skin.lb_jihuo.visible=true;
				
				this._skin.lb_title1.text="【冲穴条件】";
				startY=createCondition(qAcu,startY);
			}
			this._skin.imgLine.y=startY;
			startY+=_skin.imgLine.height+2;
			var canLevelUp:Boolean=Mgr.meridianMgr.getCanLevelUp(serverData);
			_skin.lb_tile2.y=startY;
			startY+=_skin.lb_tile2.height+2;
			//属性
			_skin.lb_tile2.text=canLevelUp?"【当前属性】":"【冲穴属性】";
			var startPos:Point=new Point(_skin.lb_shengming.x,startY);
			if (qAcu.q_stone_attribute!=0) 
			{
				var qAtt:Q_att_values=AttValueConfig.getAttInfoById(qAcu.q_stone_attribute);
				if (qAtt) 
				{
					var getTypeValueMap:HashMap = AttValueConfig.getTypeValueMap(qAtt);
					var labs:Array=AttrUtil.showAttr(getTypeValueMap,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
					labList=labList.concat(labs);
				}
				startY=startPos.y+2;
				
			}
			//下一阶属性
			if (canLevelUp) 
			{
				var nextTitle:Label=clonelab(_skin.lb_tile2);
				nextTitle.y=startY;
				startY+=nextTitle.height;
				this.addChild(nextTitle);
				nextTitle.text="【下层属性】";
				var nextMeri:Q_meridian=Mgr.meridianMgr.getNextLevelAcu(serverData);
				if (nextMeri) 
				{
					var qAttNext:Q_att_values=AttValueConfig.getAttInfoById(nextMeri.q_stone_attribute);
					var nexth:HashMap = AttValueConfig.getTypeValueMap(qAtt);
					startPos.y=startY;
					var labsn:Array=AttrUtil.showAttr(nexth,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
					labList=labList.concat(labsn);
				}
				startY=startPos.y+2;
			}
			//this._skin.imgBg.height=startY;
		//	this.height=startY;
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
				isOk=qMer.q_need_level<MainRoleManager.actorInfo.totalStat.level;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,"角色等级:"+MainRoleManager.actorInfo.totalStat.level+"级");
				lb.width=lb.textWidth;
			}
			if (qMer.q_need_meridian_id!=""&&qMer.q_need_meridian_id!=null) 
			{
				var need:Q_meridian=MeridianCfg.getMeridianCfg(qMer.q_need_meridian_id);
				
				if (need) 
				{
					var tmp:Array=need.q_meridian_id.split("_");
					var needInfo:AcuPointInfo=Mgr.meridianMgr.vo.getMeridianAcuInfo(tmp[0],tmp[1]);
					lb=clonelab(_skin.lb_shengming);
					this.addChild(lb);
					lb.y=startY;
					startY+=lb.height+2;
					isOk=needInfo!=null&&needInfo.level>=need.q_prelvl;
					lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,need.q_name+":"+qMer.q_prelvl);
					lb.width=lb.textWidth;
				}
			}
			if (qMer.q_need_spirit!=0) 
			{
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.y=startY;
				startY+=lb.height+2;
				isOk=qMer.q_need_spirit<=MainRoleManager.actorInfo.maxZhenqi;
				lb.htmlText=HtmlTextUtil.getTextColor(isOk?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED,"真气消耗:"+qMer.q_need_spirit);
				lb.width=lb.textWidth;
			}
			return startY;
		}
		private function showJXTips(acuId:String,serverData:AcuPointInfo,qAcu:Q_meridian):void
		{
			this.addChild(_skin.imgStone);
			this.addChild(_skin.lb_Stone);
			//穴位名字
			this._skin.lb_name.text=qAcu.q_name;
			//未激活
			this._skin.lb_jihuo.visible=false;
			var startY:int=_skin.lb_Item0.y+2;
			this._skin.lb_title1.text="【砭石效果】";
			if (serverData.level==-1) 
			{
				this._skin.lb_jihuo.text="未激活";
				this._skin.lb_jihuo.visible=true;
				
				this._skin.lb_title1.text="【激活条件】";
				var qActive:Q_meridian=MeridianCfg.getMeridianCfg(serverData.MeridId+"_"+serverData.acuPointId+"_0");
				
				if (qActive) 
				{
					startY=createCondition(qActive,startY);
				}
				
			}//激活了
			//没镶嵌
			var lb:Label;
			if(serverData.stone.length==0)
			{
				//冲穴
				this._skin.lb_jihuo.text="未镶嵌";
				this._skin.lb_jihuo.visible=true;
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.text="空";
				lb.y=startY;
				startY+=lb.height+2;
			}
			else
			{
				//图标。
				var citemInfo:ClientItemInfo=new ClientItemInfo(serverData.stone[0].itemModelId);
				citemInfo.itemInfo=serverData.stone[0];
				FaceUtil.SetItemGrid(stoneIcon,citemInfo,false);
				stoneIcon.x=this._skin.lb_title1.x;
				stoneIcon.y=startY;
				labList.push(stoneIcon);
				
				//名字
				lb=clonelab(_skin.lb_shengming);
				this.addChild(lb);
				lb.color=ItemConfig.getItemQualityColor(citemInfo.cfgId);
				lb.text=citemInfo.qItem.q_name;
				lb.text="空";
				lb.x=stoneIcon.x+stoneIcon.width+2;
				lb.y=startY;
				startY+=stoneIcon.height+2;
				//石头属性
				var qAtt:Q_att_values=AttValueConfig.getAttInfoById(citemInfo.qItem.q_att_type);
				var startPos:Point=new Point(lb.x,startY);
				if (qAtt) 
				{
					var nexth:HashMap = AttValueConfig.getTypeValueMap(qAtt);
					var labsn:Array=AttrUtil.showAttr(nexth,this,_skin.lb_shengming,1,startPos,_skin.lb_shengming.width,_skin.lb_shengming.height+2);
					labList=labList.concat(labsn);
				}
				startY=startPos.y;
			}
			_skin.imgLine.y=startY;
			startY+=_skin.imgLine.height+2;
			//镶嵌说明
			_skin.lb_tile2.y=startY;
			startY+=_skin.lb_tile2.height+2;
			_skin.imgStone.y=startY;
			
			_skin.lb_Stone.y=startY;
			_skin.lb_Stone.text=_initStr.replace("@",EnumMStoneType.getStoneTypeName(qAcu.q_stone_type));
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
			if (_stoneIcon) 
			{
				_stoneIcon.clear();
			}
		}

		public function get stoneIcon():IconCDFace
		{
			if (_stoneIcon==null) 
			{
				_stoneIcon=IconCDFace.getIcoFace(IcoSizeEnum.ICON_48);
			}
			return _stoneIcon;
		}

	}
}