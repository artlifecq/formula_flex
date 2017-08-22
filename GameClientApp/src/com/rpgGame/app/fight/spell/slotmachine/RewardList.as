package  com.rpgGame.app.fight.spell.slotmachine
{

	
	import com.rpgGame.core.utils.MCUtil;
	
	import flash.utils.getTimer;
	
	import away3d.tick.Tick;
	
	import feathers.themes.GuiTheme;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	

	
	public class RewardList extends Sprite
	{
		public static const SCROLL_UP:int = 1;
		public static const SCROLL_DOWN:int = -1;
		public static const REWARDlISTSTOP:String = "rewardliststop";
		public var accelearation:Number = 0.7;
		public var maxSpeed:Number = 20;
		public var minSpeed:Number = 1;
		public var isAutoStop:Boolean = false;
		private var _rewards:Array = null;
		/**当前状态 0停止 1开始滚动，2减速**/
		private var _state:int = 0; // 当前状态 0停止 1开始滚动，2减速
		private var _scrollSpeed:Number = 0;
		private var _finalReward:RewardImage = null;
		private var _direction:int;
		private var _delay:int = 0; // 超时时间，如果设置了。不管现在是何种滚动状态，只要超时就停止
		private var _beginTime:int = 0;
		
		public function RewardList( url:String)
		{
			var rewardsNum:int = 10;
			var rImg:RewardImage;
			_rewards = [];
			for (var k:int = 0; k < rewardsNum; k++) 
			{
				rImg=new RewardImage( GuiTheme.ins.getTexture(url+k+".png"));
				rImg.data=k;
				_rewards.push(rImg);
			}
			addMask( _rewards[0].width, _rewards[0].height );
		}
		public function setData( defaultNum:int = -1, dir:int = SCROLL_UP, delay:int = 0 ,needShowDefault:Boolean=false):void
		{
			MCUtil.removeAllChild(this);
			_direction = dir;
			_delay = delay;
			_rewards.sortOn("data",Array.NUMERIC);
			if( defaultNum >= 0 )
			{
				if( _direction != 1 )
					defaultNum++;
				var arr:Array = _rewards.slice( defaultNum ).concat( _rewards.slice( 0, defaultNum ) );
				_rewards = ( _direction == 1 ? arr : arr.reverse() );
				if (needShowDefault) 
				{
					this.addChild(_rewards[0]);
				}
				
			}
			//排序
			var offY:int = 0;
			var rewardsNum:int=_rewards.length;
			for ( var i:int = 0; i < rewardsNum; i++ )
			{
				var reward:RewardImage = _rewards[ i ] as RewardImage;
				reward.y = offY;
				offY += reward.height * _direction;
			}
		}
		private function addMask( maskW:int, maskH:int ):void
		{
			var _mask:Sprite = new Sprite();
			_mask.graphics.beginFill(0);
			_mask.graphics.drawRect( 0, 0, maskW, maskH );
			_mask.graphics.endFill();
			addChild( _mask );
			this.mask = _mask;
		}
		
		public function startScroll():void
		{
			_state = 1;
		
			if ( _delay != 0 )
				_beginTime = getTimer();
			
			for ( var i:int = 0; i < _rewards.length; ++i )
			{
				if( contains(_rewards[i]) == false )
					addChild(_rewards[i]);
			}
			Tick.instance.addCallBack(advanceTime);
		}
		
		public function stopScroll():void
		{
			if ( _state == 0 && _scrollSpeed == 0 )
				return;
			_state = 2;
		}
		
		public function advanceTime(timer:Number): void
		{
			timer=getTimer();
			if ( _delay != 0 && ( timer - _beginTime ) > _delay )
			{
				var index:int = _rewards.indexOf( _finalReward );
				_rewards.splice( index, 1 );
				_rewards.unshift( _finalReward );
				stopRightNow();
				dispatchEvent( new RewardListStopEvent( REWARDlISTSTOP, _rewards[0] ) );
				return;
			}
			
			for each ( var reward:RewardImage in _rewards )
			{
				reward.y -= _scrollSpeed * _direction;
			}
			
			if ( _state == 1 )
			{
				_scrollSpeed += accelearation;
				if ( Math.abs( _scrollSpeed ) > maxSpeed )
				{
					_scrollSpeed = maxSpeed;
					if ( isAutoStop ) // 如果设置了自动停止标记，则达到最高速度之后开始减速
						_state = 2;
				}
			}
			else if ( _state == 2 )
			{
				if ( Math.abs( _scrollSpeed ) > minSpeed )
				{
					_scrollSpeed -= accelearation;
				}
				else
				{
					_scrollSpeed = minSpeed;
					// 如果第二个奖励就是最终奖励，并且还没到位置，则设置奖励位置并停止
					if ( isFinalItem( _rewards[0] ) && ( Math.abs(_rewards[0].y ) <= Math.max( _rewards[0].height, minSpeed ) ) )
					{
						//_rewards[0].y = -_rewards[0].height;
						stopRightNow();
						dispatchEvent( new RewardListStopEvent( REWARDlISTSTOP, _rewards[0] ) );
						return;
					}
				}
			}
			
			while ( ( _direction == 1 && _rewards[0].y <= -_rewards[0].height ) || ( _direction == -1 && _rewards[0].y >= _rewards[0].height ) )
			{
				var firstReward:RewardImage = _rewards.shift();
				var lastReward:RewardImage = _rewards[ _rewards.length - 1 ];
				firstReward.y = lastReward.y + ( _direction == 1 ? lastReward.height : firstReward.height ) * _direction;
				_rewards.push( firstReward );
			}
		}
		
		private function isFinalItem( reward:RewardImage ):Boolean
		{
			if ( _finalReward != null )
				return ( _finalReward.data == reward.data );
			return true;
		}
		
		
		
		public function get state():int
		{
			return _state;
		}
		/**
		 * 设置奖励 
		 * @param id 奖励ID
		 * @param pos 指定奖励的位置，如果是默认的，则不改变现有的奖励序列
		 */		
		public function setFinalReward( id:int, pos:int = -1 ):void
		{
			for ( var i:int = 0; i < _rewards.length; ++i )
			{
				var reward:RewardImage = _rewards[i] as RewardImage;
				if ( reward.data == id )
				{
					_finalReward = reward;
					if ( pos != -1 && i != pos )
					{
						var posReward:RewardImage = _rewards[pos];
						swapChildren( reward, posReward );
						_rewards[pos] = reward;
						_rewards[i] = posReward;
					}
					break;
				}
			}
		}
		/**
		 * 只是中断滚动的行为，终止事件就不发了 
		 * 
		 */		
		public function stopRightNow():void
		{
		
			for ( var i:int = 0; i < _rewards.length; ++i )
			{
				_rewards[i].y = i * _rewards[i].height;
			}
			//			_rewards[0].y = 0;
			//			_rewards[1].y = _rewards[0].height;// 避免下边出现第二个奖励
			_scrollSpeed = 0;
			_state = 0;
			Tick.instance.removeCallBack(advanceTime);
		}
		
		
		
		public function setOutVisible():void
		{
			// TODO Auto Generated method stub
			if ( mask == null )
				return;
			
			for ( var i:int = 0; i < _rewards.length; ++i )
			{
				if( ( _rewards[i].y + _rewards[i].height <= 0 || _rewards[i].y >= mask.height) && contains(_rewards[i]) )
					MCUtil.removeSelf(_rewards[i]);
			}
		}
	}
}