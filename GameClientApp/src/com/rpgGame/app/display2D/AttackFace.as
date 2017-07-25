package com.rpgGame.app.display2D
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	
	import flash.geom.Point;
	
	import feathers.themes.GuiTheme;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.IStarlingTexture;
	
	/**
	 * 伤害效果
	 * @author Carver
	 */
	public class AttackFace extends Sprite implements IInstancePoolClass
	{
		//		public var easeFun:Function;
		/** 特殊类型,带来的特殊坐标偏移 **/
		private var _specialOffsetPos:Point;
		/** 个 **/
		private var _geBmpStarling:Image;
		/** 十 **/
		private var _shiBmpStarling:Image;
		/** 百 **/
		private var _baiBmpStarling:Image;
		/** 千 **/
		private var _qianBmpStarling:Image;
		/** 万 **/
		private var _wanBmpStarling:Image;
		/** 十万 **/
		private var _shiwanBmpStarling:Image;
		/** 百万 **/
		private var _baiwanBmpStarling:Image;
		/** 千万 **/
		private var _qianwanBmpStarling:Image;
		/** 亿 **/
		private var _yiBmpStarling:Image;
		/** 十亿 **/
		private var _shiyiBmpStarling:Image;
		/** +- **/
		private var _plusBmpStarling:Image;
		/** 类型,名称等.. **/
		private var _txtBmpStarling:Image;
		/** 打击效果池 **/
		private static var attackFacePool:InstancePool = new InstancePool("attackFacePool",500);
		/** 类型资源 **/
		private var _typeRes:String = "";
		/** 数字类型 **/
		private var _numberRes:String;
		private var _value:*=0;
		/** 特殊类型会有组合(例如暴击...) **/
		private var _specialType:String;
		
		private var _extendsData:AttackFace;
		
		
		private var startX:int=0;
		
		private var _isDestroyed:Boolean;
		private var _isDisposed:Boolean;
		
		/**
		 *  
		 * @param $typeRes
		 * @param $numberRes
		 * @param $value
		 * @param $specialType
		 * @param $specialOffsetPos
		 * 
		 */		
		public function AttackFace( $typeRes:String = "", $numberRes:String = "",  $value:* = 0, $specialType:String=null, $specialOffsetPos:Point = null,extendData:Object=null)
		{
			_isDestroyed = false;
			_specialOffsetPos = $specialOffsetPos || new Point();
			reSet([  $typeRes, $numberRes, $value, $specialType,_specialOffsetPos,extendData]);
		}
		
		/** 值(可以是数字,也可以是字符串) **/
		public function get value():*
		{
			return _value;
		}

		/**
		 * 创建一个AttackFace
		 * @param $typeRes 指定类型的URL
		 * @param $numberRes 飘字数字颜色类型
		 * @param $value 飘出的数值
		 * @param $specialType 飘出的数值类型
		 * @param $specialOffsetPos 飘出的数值的偏移值
		 * @return AttackFace
		 * 
		 */		
		public static function createAttackFace( $typeRes:String = "", $numberRes:String = "", $value:*=0, $specialType:String=null, $specialOffsetPos:Point=null,extendData:Object=null):AttackFace
		{
			//利用池生成AttackFace
			return attackFacePool.createObj(AttackFace, $typeRes, $numberRes, $value, $specialType, $specialOffsetPos,extendData) as AttackFace;
		}
		/**
		 * @private
		 * 回收一个AttackFace
		 * @param $avatar
		 */
		public static function recycleAttackFace($attFace:AttackFace):void
		{
			//利用池回收AttackFace
			attackFacePool.recycleObj($attFace);
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		
		/**
		 * @private
		 * reSet
		 */
		public function reSet($parameters:Array):void 
		{
			_isDisposed = false;
			removeChildren();
			_typeRes = $parameters[0];
			_numberRes =  $parameters[1];
			_value = $parameters[2];
			_specialType = $parameters[3];
			_specialOffsetPos = $parameters[4] || new Point();
//			easeFun = Linear.easeOut; 
			_extendsData=$parameters[5];
			
			addTitle();
			addNumber();
			
		}
		/**
		 * 文字
		 * 
		 */		
		public function addTitle():void
		{
			startX=0;
			if (_extendsData) 
			{
				startX=_extendsData.width+2;
				_extendsData.x=0;
				_extendsData.y=0;
				this.addChild(_extendsData);
			}
			if( _typeRes == "" )
			{
				if( _txtBmpStarling != null )
				{
					_txtBmpStarling.dispose();
					_txtBmpStarling = null;
				}
				return;
			}
			
			
			var texture:IStarlingTexture = GuiTheme.ins.getTexture( _typeRes);
			if( texture == null )
			{
				if( _txtBmpStarling != null )
				{
					_txtBmpStarling.dispose();
					_txtBmpStarling = null;
				}
				return;
			}
			
			if( _txtBmpStarling == null )
				_txtBmpStarling = new Image(texture);
			else
				_txtBmpStarling.texture = texture;
			
			addChild( _txtBmpStarling );
			_txtBmpStarling.touchAcross = true;
			_txtBmpStarling.touchable = false;
			
			_txtBmpStarling.y = -_txtBmpStarling.height * 0.5;
			//tX = _txtBmpStarling.width;
			_txtBmpStarling.x=startX;
			startX+=_txtBmpStarling.width;
		}
		
		/**
		 * 数字
		 * 
		 */		
		public function addNumber():void
		{
			if(!_numberRes){
				return;
			}
			
			if( _value is String || _value == 0 ) 
				return;	
			
			if( GuiTheme.ins == null )
				return;
			
			var tX:Number = startX;
			var texture:IStarlingTexture;
			var gap:Number = 5;
			
			
			
			var bmpUrl:String;
			if(_value > 0)
				bmpUrl = FightFaceHelper.getNumberURLByType( _numberRes, FightFaceHelper.NUMBER_JIA );
			else
				bmpUrl = FightFaceHelper.getNumberURLByType( _numberRes, FightFaceHelper.NUMBER_JIAN );
			
			texture = GuiTheme.ins.getTexture( bmpUrl );
			if( texture != null )
			{
				if(!_plusBmpStarling)
					_plusBmpStarling = new Image(texture);
				else
					_plusBmpStarling.texture = texture;
				
				_plusBmpStarling.readjustSize();
				addChild(_plusBmpStarling);
				_plusBmpStarling.touchAcross = true;
				_plusBmpStarling.touchable = false;
				
				_plusBmpStarling.x = tX + _specialOffsetPos.x;
				_plusBmpStarling.y = - _plusBmpStarling.height * 0.5 + _specialOffsetPos.y;
				tX += _plusBmpStarling.width;
			}
			
			/////////////////////////数字//////////////////////////
			var numStr:String = (Math.abs(_value)).toString();
			var image:Image;
			var nStr:String;
			var normalNum:int=0;
			var numX:int;
			for( var i:uint=0; i < numStr.length ; i++ )
			{
				normalNum++;
				nStr = numStr.charAt(i);
				bmpUrl = FightFaceHelper.getNumberURLByType( _numberRes, nStr )
				texture = GuiTheme.ins.getTexture( bmpUrl );
				if(texture == null)
					continue;
				image = setNumberImage( i, texture);
				
				if(image == null)
					continue;
				
				image.readjustSize();
				addChild( image );
				//经验类不缩放
				if(normalNum>2&&_numberRes!=FightFaceHelper.NUMBER_PC_EXP){
					image.scale=0.8;
					image.x = (image.width - gap) * i + tX - 5 + _specialOffsetPos.x+10;
				}else{
					image.x = (image.width - gap) * i + tX - 5 + _specialOffsetPos.x;
				}
				numX=image.x+image.width;
				image.touchAcross = true;
				image.touchable = false;
				image.y = - image.height * 0.5 + _specialOffsetPos.y;
			}
		
		}
		
		/**
		 * 设置数字图片
		 * @param pos
		 * @param texture
		 * @return 
		 * 
		 */		
		private function setNumberImage( pos:int, texture:IStarlingTexture ):Image
		{
			
			switch(pos)
			{
				case 0://个位
					if(!_geBmpStarling)
						_geBmpStarling = new Image(texture);
					else
						_geBmpStarling.texture = texture;
					return _geBmpStarling;
				case 1://十位
					if(!_shiBmpStarling)
						_shiBmpStarling = new Image(texture);
					else
						_shiBmpStarling.texture = texture;
					return _shiBmpStarling;
				case 2://百位
					if(!_baiBmpStarling)
						_baiBmpStarling = new Image(texture);
					else
						_baiBmpStarling.texture = texture;
					return _baiBmpStarling;
				case 3://千位
					if(!_qianBmpStarling)
						_qianBmpStarling = new Image(texture);
					else
						_qianBmpStarling.texture = texture;
					return _qianBmpStarling;
				case 4://万位
					if(!_wanBmpStarling)
						_wanBmpStarling = new Image(texture);
					else
						_wanBmpStarling.texture = texture;
					return _wanBmpStarling;
				case 5://十万位
					if(!_shiwanBmpStarling)
						_shiwanBmpStarling = new Image(texture);
					else
						_shiwanBmpStarling.texture = texture;
					return _shiwanBmpStarling;
				case 6://百万位
					if(!_baiwanBmpStarling)
						_baiwanBmpStarling = new Image(texture);
					else
						_baiwanBmpStarling.texture = texture;
					return _baiwanBmpStarling;
				case 7://千万位
					if(!_qianwanBmpStarling)
						_qianwanBmpStarling = new Image(texture);
					else
						_qianwanBmpStarling.texture = texture;
					return _qianwanBmpStarling;
				case 8://亿位
					if(!_yiBmpStarling)
						_yiBmpStarling = new Image(texture);
					else
						_yiBmpStarling.texture = texture;
					return _yiBmpStarling;
				case 9://十亿位
					if(!_shiyiBmpStarling)
						_shiyiBmpStarling = new Image(texture);
					else
						_shiyiBmpStarling.texture = texture;
					return _shiyiBmpStarling;
			}
			return null
		}
		
		private function disposeText( disImage:Image ):void
		{
			if( disImage != null )
			{
				disImage.dispose();
				disImage = null;
			}
		}
		
		/**
		 * @private
		 * 释放
		 */
		override public function dispose():void
		{
			disposeText(_geBmpStarling);
			disposeText(_shiBmpStarling);
			disposeText(_baiBmpStarling);
			disposeText(_qianBmpStarling);
			disposeText(_wanBmpStarling);
			disposeText(_shiwanBmpStarling);
			disposeText(_baiwanBmpStarling);
			disposeText(_qianwanBmpStarling);
			disposeText(_yiBmpStarling);
			disposeText(_shiyiBmpStarling);
			
			_geBmpStarling=null;
			_shiBmpStarling=null;
			_baiBmpStarling=null;
			_qianBmpStarling=null;
			_wanBmpStarling=null;
			_shiwanBmpStarling=null;
			_baiwanBmpStarling=null;
			_qianwanBmpStarling=null;
			_yiBmpStarling=null;
			_shiyiBmpStarling=null;
			if (_extendsData) 
			{
				_extendsData.dispose();
				_extendsData=null;
			}
			
		}
		
		public function putInPool():void
		{
			//			super.dispose();使用对象池无须完全销毁,否则会导致底层Mesh数据丢失而不可重用
			_typeRes = "";
			_value = 0;
			_specialType = null;
			_specialOffsetPos.x = _specialOffsetPos.y = 0;
			if( parent != null )
				parent.removeChild(this);

			_isDisposed = true;
		}
		
		public function instanceDestroy():void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
		}
		public function recycleSub():void
		{
			if (_extendsData) 
			{
				FightFaceHelper.onAtackFaceComplete(_extendsData);
				_extendsData=null;
			}
		}
	}
}