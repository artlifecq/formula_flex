package com.rpgGame.coreData.info.task
{
	import com.rpgGame.coreData.info.task.target.BaseTaskTargetInfo;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;
	
	import app.message.PrizeProto;

	/**
	 *
	 * 单个任务详细数据
	 * @author zgd
	 * 创建时间：2014-4-11 下午4:26:03
	 * 
	 */
	public class TaskDataInfo
	{
		/**章节里的第几个任务，用来排序，只当它为主线时，请求数据后才有效**/
		public var index:int = 0;
		
		/**名称*/
		public var name:String;
		/**描述*/
		public var desc:String;
		
		/**任务接受对白窗口类型**/
		//public var acceptDialogType:int = 0;
		/**任务接受对白语音**/
		//public var acceptSound:String = "";
		/**任务接受对白**/
		private var _acceptDialogVect:Vector.<String>;
		/**领取任务目标【可能为空】**/
		//public var acceptTarget:BaseTaskTargetInfo;
		
		/**目标数据列表*/
		private var _targetVec:Vector.<BaseTaskTargetInfo>;
		
		/**任务完成对白窗口类型**/
		//public var completeDialogType:int = 0;
		/**任务完成对白语音**/
		//public var completeSound:String = "";
		/**任务完成对白**/
		private var _completeDialogVect:Vector.<String>;
		/**完成任务目标【可能为空】**/
		//public var completeTarget:BaseTaskTargetInfo;
		
		/**固定**/
		public var fixPrize:PrizeInfo;
		/**选择奖励数据*/
		public var selectablePrizeInfoVect:Vector.<PrizeInfo>;
		
		public function TaskDataInfo()
		{
			_targetVec = new Vector.<BaseTaskTargetInfo>();
			_acceptDialogVect = new Vector.<String>;
			_completeDialogVect = new Vector.<String>();
			selectablePrizeInfoVect = new Vector.<PrizeInfo>;
		}
		
		public function addTargetInfo(value:BaseTaskTargetInfo):void
		{
			_targetVec.push(value);
		}
		
		public function getTargetInfoAt(index:int):BaseTaskTargetInfo
		{
			return _targetVec[index];
		}
		
		public function clearTargetInfo():void
		{
			_targetVec.length = 0;
		}
		
		public function getAllTargetInfo():Vector.<BaseTaskTargetInfo>
		{
			return _targetVec.concat();
		}
		
		public function hasCompleteDialog():Boolean
		{
			return _completeDialogVect && _completeDialogVect.length;
		}
		
		public function hasAcceptDialog():Boolean
		{
			return _acceptDialogVect && _acceptDialogVect.length;
		}
		
		public function setPrizeInfo( fixPrizeProto:PrizeProto, prizeArr:Array ):void
		{
			fixPrize = ProtoParseToInfo.decodePrizeProto( fixPrizeProto );
			
			if( prizeArr == null )
				return;
			
			var len:int = prizeArr.length;
			for( var i:int = 0;i < len; i++ )
			{
				selectablePrizeInfoVect.push( ProtoParseToInfo.decodePrizeProto( prizeArr[i] ) );
			}
		}
		
		/**
		 * 接受对话
		 * @param dialogArr
		 * 
		 */		
		public function setAcceptDialog( dialogArr:Array ):void
		{
			if( dialogArr == null )
				return;
			
			var len:int = dialogArr.length;
			for( var i:int = 0;i < len; i++ )
			{
				_acceptDialogVect.push( dialogArr[i] )
			}
		}
		
		/**
		 * 完成对话
		 * @param dialogArr
		 * 
		 */		
		public function setCompleteDialog( dialogArr:Array ):void
		{
			if( dialogArr == null )
				return;
			
			var len:int = dialogArr.length;
			for( var i:int = 0;i < len; i++ )
			{
				_completeDialogVect.push( dialogArr[i] );
			}
		}

		/**提交任务对白数据*/
		public function get completeDialogVect():Vector.<String>
		{
			return _completeDialogVect;
		}

		/**接受任务对白*/
		public function get acceptDialogVect():Vector.<String>
		{
			return _acceptDialogVect;
		}

		
	}
}
