package  com.rpgGame.appModule.xinfa.sub
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.view.icon.BaseIcon;
	import com.rpgGame.appModule.jingmai.sub.MeridianMapLine;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class CheatsMap extends SkinUI
	{
		//经脉图id
		private var _cheatsVo:CheatsVo;
		private var pointHash:HashMap;
		public var pos:int;
		//用来快速查找点击对象
		private var nameDic:Dictionary=new Dictionary();
		private var linesContianer:Sprite;
		private var firstLine:MeridianMapLine;
		private var imgGrid:UIAsset;
		private var _btn:Radio;
		public function CheatsMap(skin:StateSkin,data:CheatsVo,btn:Radio)
		{
			super(skin);
			linesContianer=new Sprite();
			linesContianer.touchable=false;
			imgGrid=_stateSkin["ico_xinfa"];
			this._stateSkin["grp_icon"].addChildAt(linesContianer,0);
			this._cheatsVo=data;
			this._btn=btn;
			this._btn.userData=_cheatsVo;
			var keys:Array=_cheatsVo.subNodeHash.keys();
			pointHash=new HashMap();
			var len:int=keys.length;
			var tmpPoint:UIAsset;
		
			var tmpLab:Label;
			var mp:CheatsNodePoint;
		
		
			var posA:Array;
			var next:UIAsset;
			var centerPos:Point;
			var tmpC:CheatsNodeVo;
			var drawLine:MeridianMapLine;
			var nodeMap:Dictionary=new Dictionary();
			for (var i:int = 0; i <len; i++) 
			{
				tmpPoint=_stateSkin["ico_"+(1+i)];
				tmpC=_cheatsVo.getSubNode(keys[i]);
				nodeMap[tmpC.getConfig().q_node_id]=tmpPoint;
				tmpLab=_stateSkin["lab_"+(1+i)];
				mp=new CheatsNodePoint(tmpPoint,tmpLab);
				nameDic[tmpPoint.name]=mp;
				pointHash.put(tmpC.chetasNodeId,mp);
			}
			tmpPoint=_stateSkin["ico_1"];
			var firstStartPt:Point=imgGrid.localToGlobal(new Point(imgGrid.width/2,imgGrid.height/2));
			_stateSkin["grp_icon"].globalToLocal(firstStartPt,firstStartPt);
			firstLine=new MeridianMapLine("ui/app/beibao/jingmai/line/shang.png","ui/app/beibao/jingmai/line/d2.png",[firstStartPt,new Point(tmpPoint.x+tmpPoint.width/2,tmpPoint.y+tmpPoint.height/2)]);
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
							drawLine=new MeridianMapLine("ui/app/beibao/jingmai/line/shang.png","ui/app/beibao/jingmai/line/d2.png",posA);
							lines.push(drawLine);
							linesContianer.addChild(drawLine);
						}
					}
					(pointHash.getValue(tmpC.chetasNodeId) as CheatsNodePoint).setLineArr(lines);
					(pointHash.getValue(tmpC.chetasNodeId) as CheatsNodePoint).setData(tmpC);
				}
			}
			imgGrid.userData=this;
			_btn.userData=this;
			TipTargetManager.show( imgGrid, TargetTipsMaker.makeTips( TipType.CHEATS_TIP, this));
			TipTargetManager.show( _btn, TargetTipsMaker.makeTips( TipType.CHEATS_TIP, this));
			//===================
			//this.touchGroup=true;
			if (data.level>0) 
			{
				_btn.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"第"+data.level+"重");
			}
			else 
			{
				_btn.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"未激活");
			}
			MCUtil.BringToTop(imgGrid);
			//设置icon
			var _icon:BaseIcon=new BaseIcon(IcoSizeEnum.ICON_48);
			_icon.x=7;
			_icon.y=5;
			imgGrid.addChild(_icon);
			_icon.setIconResName(ClientConfig.getCheatsIcon(data.cheatsConfig.q_id,IcoSizeEnum.ICON_48));
			updateFirstLine(false);
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
		public function updatCheatsInfo(data:CheatsVo):void
		{
			this._cheatsVo=data;
			
			var str:String="未激活";
			if (data.level>0) 
			{
				_btn.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"第"+data.level+"重");
			}
			else 
			{
				_btn.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"未激活");
			}
			
			updateFirstLine(true);
			updataServerData(data.subNodeHash.values());
		}
		public function showHideLv(bool:Boolean):void
		{
			_stateSkin["grp_label"].visible=bool;
		}
		public function updataServerData(data:Array,playEff:Boolean=false):void
		{
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
	}
}