package  com.rpgGame.appModule.xinfa.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.view.icon.BaseIcon;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.appModule.jingmai.sub.MerdianPoint;
	import com.rpgGame.appModule.jingmai.sub.MeridianMapLine;
	import com.rpgGame.core.events.CheatsEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.IRewardCheck;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.filters.FragmentFilter;
	
	public class CheatsMap extends SkinUI implements IRewardCheck
	{
		//经脉图id
		private var _cheatsVo:CheatsVo;
		private var pointHash:HashMap;
		public var pos:int;
		//用来快速查找点击对象
		private var nameDic:Dictionary=new Dictionary();
		private var linesContianer:Sprite;
		private var firstLine:MeridianMapLine;
		private var imgIcon:BgIcon;
		private var _btn:XinFaBtnExt;
		private var _grayFilter:FragmentFilter=null;
		public function CheatsMap(skin:StateSkin,data:CheatsVo,btn:XinFaBtnExt)
		{
			super(skin);
			linesContianer=new Sprite();
			linesContianer.touchable=false;
			imgIcon=new BgIcon(IcoSizeEnum.ICON_48);
			_stateSkin["ico_xinfa"].width=_stateSkin["ico_xinfa"].height=72;
			imgIcon.bindBg(_stateSkin["ico_xinfa"]);
			skin.container.addChild(imgIcon);
			this._stateSkin["grp_icondi"].addChildAt(linesContianer,0);
			this._cheatsVo=data;
			this._btn=btn;
			this._btn.userData=_cheatsVo;
			var keys:Array=_cheatsVo.subNodeHash.keys();
			pointHash=new HashMap();
			var len:int=keys.length;
			var tmpPoint:SkinnableContainer;
		

			var mp:CheatsNodePoint;
		
		
			var posA:Array;
			var prePoint:SkinnableContainer;
			var centerPos:Point;
			var tmpC:CheatsNodeVo;
			var drawLine:MeridianMapLine;
			var nodeMap:Dictionary=new Dictionary();
			for (var i:int = 0; i <len; i++) 
			{
				tmpPoint=_stateSkin["icd_"+(1+i)];
				tmpC=_cheatsVo.getSubNode(keys[i]);
				nodeMap[tmpC.getConfig().q_node_id]=tmpPoint;
				mp=new CheatsNodePoint(tmpPoint.skin as XinfaIconSkin);
				nameDic[tmpPoint.name]=mp;
				pointHash.put(tmpC.chetasNodeId,mp);
			}
			tmpPoint=_stateSkin["icd_1"];
			var firstStartPt:Point=imgIcon.localToGlobal(new Point(imgIcon.width/2,imgIcon.height/2));
			var lineUrl:String="ui/app/beibao/jingmai/line/lang/"+_cheatsVo.cheatsConfig.q_default+".png";
			var lineUrl2:String="ui/app/beibao/jingmai/line/an/"+_cheatsVo.cheatsConfig.q_default+".png";
			//第一段线的起点
			firstStartPt=_stateSkin["grp_icondi"].globalToLocal(firstStartPt);
			firstLine=new MeridianMapLine(lineUrl,lineUrl2,[firstStartPt.clone(),new Point(tmpPoint.x+tmpPoint.width/2,tmpPoint.y+tmpPoint.height/2)]);
			linesContianer.addChild(firstLine);
			//计算链接
			for (var j:int = 0; j < len; j++) 
			{
				var lines:Array;
				tmpC=_cheatsVo.getSubNode(keys[j]);
				var linkStr:String=tmpC.getConfig().q_link_nodes;
				var coord:String=tmpC.getConfig().q_coord;
				if (linkStr!=null&&linkStr!="") 
				{
					lines=[];
					var idArr:Array=linkStr.split(",") as Array;
					var coordsArr:Array;
					if (coord!=null&&coord!="") 
					{
						coordsArr=JSON.parse(coord) as Array;
					}
					var num:int=idArr.length;
					var startObj:DisplayObject=nodeMap[tmpC.getConfig().q_node_id];
					for (var k:int = 0; k < num; k++) 
					{
						if (idArr[k]==tmpC.getConfig().q_node_id) 
						{
							continue;
						}
						var endObj:DisplayObject=nodeMap[idArr[k]];
						if (endObj) 
						{
							posA=[new Point(startObj.x+startObj.width/2,startObj.y+startObj.height/2)];
							if (coordsArr&&k<coordsArr.length) 
							{
								posA.push(new Point(int(coordsArr[k][0])+startObj.width/2,int(coordsArr[k][1])+startObj.height/2));
							}
							posA.push(new Point(endObj.x+endObj.width/2,endObj.y+endObj.height/2));
							drawLine=new MeridianMapLine(lineUrl,lineUrl2,posA);
							lines.push(drawLine);
							linesContianer.addChild(drawLine);
						}
					}
				}
				(pointHash.getValue(tmpC.chetasNodeId) as CheatsNodePoint).setLineArr(lines);
				(pointHash.getValue(tmpC.chetasNodeId) as CheatsNodePoint).setData(tmpC);
			}
			imgIcon.userData=this;
			_btn.userData=this;
			TipTargetManager.show( imgIcon, TargetTipsMaker.makeTips( TipType.CHEATS_TIP, this));
			TipTargetManager.show( _btn, TargetTipsMaker.makeTips( TipType.CHEATS_TIP, this));
			//===================
			//this.touchGroup=true;
//			if (data.level>0) 
//			{
//				_btn.label=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"第"+data.level+"重");
//			}
//			else 
//			{
//				_btn.label=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"未激活");
//			}
			//_btn.label="xxxxxxxxxxxxxxsssssssss";
			MCUtil.BringToTop(imgIcon);
			//设置icon
			imgIcon.setIconResName(ClientConfig.getCheatsIcon(data.cheatsConfig.q_icon,IcoSizeEnum.ICON_48));
			updateFirstLine(false);
			updateBtnState();
		}
		public function updateBtnState():void
		{
			var noGray:Boolean=false;
			if (_cheatsVo.level>0) 
			{
				noGray=true;
			}
			else
			{
				noGray=Mgr.cheatsMgr.getCanActive(_cheatsVo.cheatsConfig.q_id);
			}
			_btn.filter=noGray>0?null:grayFilter;
			notifyUpdate(RTNodeID.XF+"_"+_cheatsVo.cheatsConfig.q_id);
		}
		private function updateFirstLine(useTween:Boolean):void
		{
			if (_cheatsVo.level>0) 
			{
				if (useTween) 
				{
					firstLine.tweenDrawInnerLine();
				}
				else
				{
					firstLine.drawInner();
				}
			}
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		public function playSuccessEff():void
		{
			var eff:Inter3DContainer=new Inter3DContainer();
			this.addChild(eff);
			eff.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_XINFA),imgIcon.x+this.imgIcon.width/2,imgIcon.y+this.imgIcon.height/2,1,function():void
			{
				eff.dispose();
				MCUtil.removeSelf(eff);
			}
				,addEft);
		}
		public function updatCheatsInfo(data:CheatsVo):void
		{
			
			this._cheatsVo=data;
			if (_cheatsVo.isLevelUp) 
			{
				_cheatsVo.isLevelUp=false;
				playSuccessEff();
			}
			updateBtnState();
//			var str:String="未激活";
//			if (data.level>0) 
//			{
//				_btn.label=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"第"+data.level+"重");
//			}
//			else 
//			{
//				_btn.label=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"未激活");
//			}
			
			updateFirstLine(true);
			updataServerData(data.subNodeHash.values());
			Mgr.cheatsMgr.dispatchEvent(new CheatsEvent(CheatsEvent.CHEATS_TIP_CHANGE,this));
		}
		public function showHideLv(bool:Boolean):void
		{
			_stateSkin["grp_label"].visible=bool;
		}
		public function updataServerData(data:Array,playEff:Boolean=false):void
		{//playSuccessEff();
			if (data) 
			{
				var len:int=data.length;
				var acuData:CheatsNodeVo;
				var mp:CheatsNodePoint;
				for (var i:int = 0; i < len; i++) 
				{
					acuData=data[i];
					mp=pointHash.getValue(acuData.chetasNodeId);
					if (mp) 
					{
						if (playEff) 
						{
							mp.playSuccessEff();
						}
						mp.setData(acuData);
					}
				}
				notifyUpdate(RTNodeID.XF+"_"+_cheatsVo.cheatsConfig.q_id);
			}
		}
		public function checkCareDataUpdate(acu:CheatsNodeVo):void
		{
			if (acu) 
			{
				var points:Array=pointHash.values();
				var key:String=acu.getConfig().q_node_id;
				for each (var p:CheatsNodePoint in points)
				{
					if (p.careNodeId==key) 
					{
						p.setData(p.data,true);
					}
				}
				notifyUpdate(RTNodeID.XF+"_"+_cheatsVo.cheatsConfig.q_id);
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target&&target.hasOwnProperty("name")) 
			{
				var mp:CheatsNodePoint=nameDic[target.name];
				if (mp) 
				{
					mp.ClickMe();
				}
			}
		}
	
		
		public function checkForUpdate():void
		{
			// TODO Auto Generated method stub
			var points:Array=pointHash.values();
			for each (var p:CheatsNodePoint in points)
			{
				p.setData(p.data);
			}
			notifyUpdate(RTNodeID.XF+"_"+_cheatsVo.cheatsConfig.q_id);
		}
		public function checkForUpdateJX():void
		{
			var points:Array=pointHash.values();
			for each (var p:CheatsNodePoint in points)
			{
				if (p.data.getNodeType()==1) 
				{
					p.setData(p.data);
				}
			}
			notifyUpdate(RTNodeID.XF+"_"+_cheatsVo.cheatsConfig.q_id);
		}
		public function hideEffect():void
		{
			// TODO Auto Generated method stub
			var points:Array=pointHash.values();
			for each (var p:CheatsNodePoint in points)
			{
				p.showLoopEffect(false);
			}
		}

		public function get cheatsVo():CheatsVo
		{
			return _cheatsVo;
		}
		public function resumeEffect():void
		{
			var points:Array=pointHash.values();
			for each (var p:CheatsNodePoint in points)
			{
				p.resumeEffect();
			}
		}

		private function get grayFilter():FragmentFilter
		{
			if (!_grayFilter) 
			{
				_grayFilter=FilterUtil.getGrayFilter();
			}
			return _grayFilter;
		}
		public function hasReward():Boolean
		{
			//没激活
			if (_cheatsVo.level<1) 
			{
				return Mgr.cheatsMgr.getCanActive(_cheatsVo.cheatsConfig.q_id);
			}
			var points:Array=pointHash.values();
			for each (var p:CheatsNodePoint in points)
			{
				if (p.hasReward) 
				{
					return true;
				}
			}
			return false;
		}
		public function get offsetX():int
		{
			return -(_stateSkin["ico_xinfa"].x+_stateSkin["ico_xinfa"].width/2);
		}
		public function get offsetY():int
		{
			return -(_stateSkin["ico_xinfa"].y+_stateSkin["ico_xinfa"].height/2);
		}
	}
}