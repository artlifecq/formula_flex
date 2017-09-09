package com.rpgGame.core.manager.tips
{
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.core.view.ui.tip.vo.IDynamicTipData;
	import com.rpgGame.core.view.ui.tip.vo.TextTipsData;
	import com.rpgGame.core.view.ui.tip.vo.TextTipsPropChangeData;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	import utils.TimerServer;
	
	/**
	 * <b>Tips管理器<b></br>
	 * <font color=#FF0000><b>此管理器功能简单粗暴，tip显示对象具体有什么类容长什么样都跟此类无关</b></font></br>
	 * <font color=#FF0000><b>管理显示对象在舞台上的添加、删除</b></font></br>
	 * <font color=#FF0000><b>管理显示对象在舞台上面位置的检测功能(防止出边界)</b></font></br>
	 * <font color=#FF0000><b>管理Tips对象池</b></font></br>
	 * <font color=#0000FF><b>例子: TipTargetManager.addTxtTipTarget( skin.guildBtn, TargetTipsMaker.makeSimpleTextTips( "帮派" ));</b></font></br>
	 * @author Wing
	 */	
	public class TipManager
	{
		/**tips距离鼠标的偏移量*/
		private static const OffsetX:int = 20;
		private static const OffsetY:int = 5;
		
		/**tips容器，整个游戏有且只有此一个*/
		private static var _tipContiner:Sprite;
		/**tips数据解析器*/
		private static var _tipParserClasses:Dictionary;
		/**tips解析器对象池*/
		private static var _tipParserPools:Dictionary;
		/**当前显示的tips对象*/
		private static var _currentSowTips:ITip;
		/**当前显示的data**/
		private static var _currentData : *;
		
		public static function setup():void
		{
			_tipContiner = new Sprite();
			_tipContiner.touchGroup = false;
			_tipContiner.touchable = false;
			_tipParserClasses = new Dictionary();
			StarlingLayerManager.tipUILayer.addChild(_tipContiner);
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         public
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * 注册tips数据解析器
		 * @param type
		 * @param cls
		 */		
		public static function registerTipsParserClass(type:int, cls:Class):void
		{
			_tipParserClasses[type] = cls;
		}
		
		/**
		 *  显示一个tips
		 * @param tipType  tips类型, 详见 TipType	【tips解析器类型】
		 * @param args	【tips数据】
		 * @param pos	【tips显示的位置，传进来的坐标点应该是整形】
		 */		
		public static function show( $tipType:int, $tipData:*, $pos:Point = null):void
		{
			var tip:ITip;
			tip = getTips( $tipType );
			
			if( tip == null )
				return;
			
			
			if(_currentData != $tipData)
			{
				tip.setTipData($tipData);
				_currentData = $tipData;
			}else if(_currentData is TextTipsData){
				tip.setTipData($tipData);
			}else if(_currentData is TextTipsPropChangeData){
				tip.setTipData($tipData);
			}
			else if (_currentData is IDynamicTipData) 
			{
				tip.setTipData($tipData);
			}
			
			_currentSowTips = tip;
			if(_currentSowTips && _currentSowTips as DisplayObject != null && (_currentSowTips as DisplayObject).parent == null)
			{
				_tipContiner.addChild(_currentSowTips as DisplayObject);
				_tipContiner.visible = false;
				TimerServer.remove(showTipContiner);
				TimerServer.add(showTipContiner,200,[$pos]);
			}
		}
		
		private static function showTipContiner($pos:Point = null):void
		{
			_tipContiner.visible = true;
			updatePositon($pos);
		}
		
		public static function updatePositon($pos:Point = null):void
		{
			if(!_currentSowTips)
				return;
			if( $pos == null )
			{
				$pos =TipTargetManager.stagePoint;
			}
			$pos.x = $pos.x + OffsetX;
			$pos.y = $pos.y + OffsetY;
			if($pos.x + _currentSowTips.width > Starling.current.stage.stageWidth)
			{
				//$pos.x = $pos.x - _currentSowTips.width/2;// - ($pos.x + _currentSowTips.width-Starling.current.stage.stageWidth) ;
				$pos.x = $pos.x - _currentSowTips.width;
			}
			if($pos.y + _currentSowTips.height > Starling.current.stage.stageHeight)
			{
				$pos.y = $pos.y - _currentSowTips.height;
			}
			if($pos.x  < 0)
			{
				$pos.x = 0;
			}
			if($pos.y < 0)
			{
				$pos.y = 0;
			}
			_tipContiner.x = int($pos.x);
			_tipContiner.y = int($pos.y);
		}
		/**
		 * 移除tips显示
		 */		
		public static function remove():void
		{
			TimerServer.remove(showTipContiner);
			if(_currentSowTips)
			{
				_currentSowTips.hideTips();
			}
			_currentSowTips = null;
			
			while(_tipContiner.numChildren > 0)
			{
				_tipContiner.removeChildAt(0);
			}
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         private
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * 获得具体的tips解析器对象
		 * @param type
		 * @return 
		 */		
		private static function getTips(type:int):ITip
		{
			var cls:Class = _tipParserClasses[type];
			if(cls)
			{
				return cls.instance;
			}
			return null;
		}
	}
}
