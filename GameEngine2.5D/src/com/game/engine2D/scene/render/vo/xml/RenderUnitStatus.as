package com.game.engine2D.scene.render.vo.xml
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.scene.StatusConvert;
	import com.game.engine2D.scene.render.vo.ActionInfo;
	import com.game.engine2D.scene.render.vo.SheetData;
	
	import flash.utils.Dictionary;
	
	/**
	 * @author Carver
	 */	
	public class RenderUnitStatus
	{
		/**
		 * 资源地址
		 */
		public var fullSourchPath:String;
		private var _angle:int;
		private var _blendMode:String = "normal";
		/**
		 * 位图资源原始位置数据集合
		 * key: angle_frame
		 * value: AvatatPartData
		 */
		private var _apd_dict:Dictionary;
		private var _actionInfoDic:Dictionary;
		private var _frameTmDic:Dictionary;
		
		public function get blendMode():String
		{
			return _blendMode;
		}
		
		public function initForBitmapData($fullSourchPath:String,status:uint,angle:uint,frame:uint, bitmapDataWidth:int,bitmapDataHeight:int):void
		{
			fullSourchPath = $fullSourchPath;
//			frame = 1;
			_angle = 1;
//			time = 1000;
			_apd_dict = new Dictionary();
			var apd:RenderUnitData = new RenderUnitData(0,null,1,false);
			apd.angle = angle;
			apd.frame = frame;
			apd.width = bitmapDataWidth;
			apd.height = bitmapDataHeight;
			apd.tx = bitmapDataWidth >> 1;
			apd.ty = bitmapDataHeight >> 1;
			_apd_dict[StatusConvert.getIdByNum(status, apd.angle, apd.frame)] =apd;
		}
		
		public function initActionDic(actionName:uint,angle:int,actionInfo:ActionInfo):void
		{
			_actionInfoDic = new Dictionary();
			_actionInfoDic[StatusConvert.getIdByNum(actionName,angle,0)] = actionInfo;
		}
		
		public function getTime(actionName:uint,angle:int,frame:int):int
		{
			var key:uint = StatusConvert.getIdByNum(actionName, angle, frame);
			if(_frameTmDic)
			{
				var tm:int = _frameTmDic[key];
				if(tm > 0)
				{
					return tm;
				}
				var apd:RenderUnitData = getRenderUnitData(actionName,angle,frame);
				if(apd)
				{ 
					tm = apd.duration;
					_frameTmDic[key] = tm;
					return tm;
				}
			}
			return 0;
		}
		
		public function getTotalFrame(actionName:uint,angle:int):int
		{
			var actionInfo:ActionInfo = getActionInfo(actionName,angle);
			return actionInfo?actionInfo.totalFrame:0;
		}
		
		public function getKeyFrame(actionName:uint,angle:int):uint
		{
			var actionInfo:ActionInfo = getActionInfo(actionName,angle);
			return actionInfo?actionInfo.keyFrame:0;
		}
		
		public function getKeyFrameTm(actionName:uint,angle:int):uint
		{
			var actionInfo:ActionInfo = getActionInfo(actionName,angle);
			return actionInfo?actionInfo.keyFrameTime:0;
		}
		
		public function getTotalFrameTm(actionName:uint,angle:int):uint
		{
			var actionInfo:ActionInfo = getActionInfo(actionName,angle);
			return actionInfo?actionInfo.totalTime:0;
		}
		
		/**
		 * 总方向数
		 */
		public function get angle():int
		{
			return _angle;
		}

		/**
		 * 读取位图资源原始位置数据
		 * @param $angle 0-7
		 * @param $frame 1-totalFrame
		 */
		public function getRenderUnitData(actionName:uint, $angle:int, $frame:int):RenderUnitData
		{
			var key:uint = StatusConvert.getIdByNum(actionName, $angle, $frame);
			var rud:RenderUnitData=_apd_dict[key] as RenderUnitData;
			if(!rud)
			{
				key = StatusConvert.getIdByNum(actionName, GlobalConfig2D.resAngleFunc($angle), $frame);
				rud=_apd_dict[key] as RenderUnitData;
			}
			return rud;
		}
		
		public function dispose():void
		{
			fullSourchPath = null;
			_apd_dict = null;
			_actionInfoDic = null;
			_frameTmDic = null;
		}
		
		public function initForDic($fullSourchPath:String, actionInfoDic:Dictionary):void
		{
			_blendMode = actionInfoDic["blendMode"];
			delete actionInfoDic["blendMode"];
			_actionInfoDic = actionInfoDic;
			fullSourchPath = $fullSourchPath;
			_angle = 8;
			_frameTmDic = new Dictionary();
			
			if(_angle!=1)_angle=8;//如果缺省@a则认为是8方向
			_apd_dict = new Dictionary();
			var apd:RenderUnitData;
			for each (var actionInfo:ActionInfo in _actionInfoDic) 
			{
				var length:int = actionInfo.framVec.length;
				var sheetData:SheetData;
				for (var i:int = 0; i < length; i++) 
				{
					sheetData = actionInfo.framVec[i];
					var key:uint = StatusConvert.getIdByNum(actionInfo.action, actionInfo.angle, i);
					var isKeyFrame:Boolean = i == actionInfo.keyFrame;
					apd = new RenderUnitData(actionInfo.actionName,sheetData,i,isKeyFrame);
					_apd_dict[key] =apd;
				}
			}
		}
		
		private function getActionInfo(actionName:uint,angle:int):ActionInfo
		{
			var info:ActionInfo=_actionInfoDic[StatusConvert.getIdByNum(actionName, angle, 0)];
			if(!info)
				info=_actionInfoDic[StatusConvert.getIdByNum(actionName, GlobalConfig2D.resAngleFunc(angle), 0)];
			return info;
		}

		public function isNeedScaleX(actionName:uint,angle:int):Boolean
		{
			var info:ActionInfo=_actionInfoDic[StatusConvert.getIdByNum(actionName, angle, 0)];
			if(!info)
			{
				info=_actionInfoDic[StatusConvert.getIdByNum(actionName, GlobalConfig2D.resAngleFunc(angle), 0)];
				if(info)
					return true;
			}
			return false;
		}
	}
}