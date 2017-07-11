package  com.rpgGame.app.manager.hint
{
    import com.gameClient.utils.HashMap;
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.core.manager.StarlingLayerManager;
    import com.rpgGame.core.utils.MCUtil;
    import com.rpgGame.coreData.cfg.HintCfgData;
    import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
    
    import flash.display.Stage;
    import flash.geom.Point;
    import flash.utils.setTimeout;
    
    import feathers.controls.UIAsset;
    
    import gs.TimelineLite;
    import gs.TweenMax;
    
    import starling.core.Starling;
    import starling.display.DisplayObject;
    
    /**
     * 漂浮文字提示 
     * @author Administrator
     */
    public class FloatingText extends HintLineSprite
    {
        // 坐标位置显示，渐隐消失
        public static const TYPE_STATIC:int = 0;

        // 向上滑出，停留3秒，向上切出消失
        public static const TYPE_MOUSE:int = 3;
        
        // 向上漂浮30像素，漂浮过程中渐隐消失
        public static const TYPE_MOUSE_UP_HIDE:int = 4;
        
        // 向上漂浮30像素，漂浮过程中渐隐消失 加速版
        public static const TYPE_MOUSE_UP:int = 5;
		
		// 从猪脚的脚下升到腰上
		public static const TYPE_ROLE_CENTER:int = 6;
        // 坐标位置显示，向上漂浮30像素，漂浮过程中渐隐消失
        public static const TYPE_UP_HIDE:int = 7;
		//从左到右
		public static const TYPE_LEFTTORIGHT:int = 8;
		
	
		private var _bg:UIAsset;
		//private var preBmp:Bitmap;
        
        /**
         * 显示一个上浮文字
         * @param html 内容 
         * @param where 全局坐标点/显示对象
         * @return 
         */
        public static function showUp(html:String, where:* = null):uint
        {
            var ft:FloatingText;
            var pt:Point;
            var type:int = TYPE_UP_HIDE;
            
            if (where is Point)
            {
                pt = where as Point;
            }
            else if (where is DisplayObject)
            {
                var dis:DisplayObject = where as DisplayObject;
                pt = dis.localToGlobal(new Point(dis.width / 2, dis.height / 2));
            }
            else
            {
                pt = new Point();
                type = TYPE_MOUSE_UP;
            }
			if (pool.length==0) 
			{
				ft = new FloatingText(html, type, pt.x, pt.y, 0xff0000, true);
			}
			else
			{
				ft=pool.pop();
				ft.resetData(html, type, pt.x, pt.y,  0xff0000, true);
			}
            
			StarlingLayerManager.hintUILayer.addChild(ft);
            return ft.gid;
        }
		
		/**
		 * 显示一个从左到右的文字
		 * @param html 内容 
		 * @param where 全局坐标点/显示对象
		 * @return 
		 * 
		 */
		public static function showLeftToRight(html:String,offx:int=0,offy:int=0):uint
		{
			var ft:FloatingText;
			var type:int = TYPE_LEFTTORIGHT;
			
			
			ft = new FloatingText(html, type,offx,offy,30);
			StarlingLayerManager.hintUILayer.addChild(ft);
			return ft.gid;
		}
		
        
        private var _tm:TweenMax; // 控制漂浮缓动
        private var _type:int = TYPE_STATIC;
        private var _timerId:int = 0;
        private var _gid:int;
		private var _offX:int;
		private var _offY:int;
        
        public static var FLOATING_TEXT_GID:int = 1;
        public static var listHash:HashMap = new HashMap();
        
        public static function getFloatingText(gid:int):FloatingText
        {
            return listHash.get(gid) as FloatingText;
        }
        
        public static function delFloatingText(gid:int):Boolean
        {
            var ft:FloatingText = getFloatingText(gid);
            if (ft != null)
            {
                ft.destory();
                return true;
            }
            
            return false;
        }
		private function resetData(info:String, type:int, xPos:int = 0, yPos:int = 0, color:int = 0xff0000, isHtml:Boolean = false):void
		{
			_gid = FLOATING_TEXT_GID++;
			
			
			setText(info,color);
			if (_bg) 
			{
				_bg.width=_label.width+80;
				_bg.x = -40;
				_bg.height=_label.height+6;
			}
			_type = type;
			_offX = x = xPos;
			_offY = y = yPos;
			//            filters = [FilterUtil.getTextFilter()];
			
			
			beginShow();
			
			listHash.put(_gid, this);
		}
        public function FloatingText(info:String, type:int, xPos:int = 0, yPos:int = 0, color:int = 0xff0000, isHtml:Boolean = false)
        {
			var _hintTypeSet:HintTypeSetInfo=HintCfgData.getHintTypeSet(NoticeManager.MOUSE_FOLLOW_TIP);
            super(_hintTypeSet);
			if (_hintTypeSet.bg)
			{
				_bg = new UIAsset();
				_bg.visible = true;
				_bg.styleName = _hintTypeSet.bg;
				addChildAt(_bg,0);
			}
           resetData(info,type,xPos,yPos,color,isHtml);
        }
        
        /**
         * 开始显示 
         * 
         */
        private function beginShow():void
        {
            var tweenParam:* = {};
            var timeLine:TimelineLite;
			var stage:flash.display.Stage = Starling.current.nativeStage;
            if (_type == TYPE_MOUSE)
            {
                x = stage.mouseX - width / 2 + _offX;
                y = stage.mouseY - height + 100 + _offY - 10;
				if(x > stage.stageWidth - width)
					x = stage.stageWidth - width;
				
				if(y > stage.stageHeight - height)
					y =  stage.stageHeight - height;
                alpha = 0;
                tweenParam["y"] = y - 100;
                tweenParam["alpha"] = 1;
                tweenParam["onComplete"] = showComplete;
                _tm = TweenMax.to(this, 1, tweenParam);
            }
            else if (_type == TYPE_MOUSE_UP_HIDE)
            {
                x = stage.mouseX - width / 2 + _offX;
                y = stage.mouseY - height + _offY;
                alpha = 1;
//                tweenParam["y"] = y - 40;
//                tweenParam["alpha"] = 0.6;
//                //tweenParam["ease"] = Quart.easeOut;
//                tweenParam["onComplete"] = showComplete;
//                _tm = TweenMax.to(this, 3, tweenParam);
				
				timeLine = new TimelineLite();
				timeLine.append( new TweenMax( this, 2.5, { y: y- 40 } ) );
				timeLine.append( new TweenMax( this, .5, { alpha:0.6, onComplete:showComplete } ) );
            }       
            else if (_type == TYPE_MOUSE_UP)
            {
                x = stage.mouseX - width / 2;
                y = stage.mouseY - height;
				if( x + width > stage.stageWidth)
				{
					x = stage.stageWidth - width - 5; //往里靠5个像素
				}
				else if( x <= 0 )
				{
					x = 5;
				}
                alpha = 1;
				
				timeLine = new TimelineLite();
				timeLine.append( new TweenMax( this, 1.5, { y: y- 40, onComplete:showComplete  } ) );
            }               
            else if (_type == TYPE_STATIC)
            {
				x -= width / 2;
                showComplete();
            }
            else if (_type == TYPE_UP_HIDE)
            {
				x -= width / 2;
                
                timeLine = new TimelineLite();
                timeLine.append( new TweenMax( this, 1.5, { y: y- 40, onComplete:showComplete  } ) );
            }            
			else if ( _type == TYPE_ROLE_CENTER )
			{
				x = 0;
				y = 0;
//				if ( Mgr.mainPlayerV != null )
//				{
//					var playerPt:Point = MapUtil.getObjectVScreenPt(Mgr.mainPlayerV );
//					x = playerPt.x - ( this.uiWidth / 2 );
//					y = playerPt.y;
//				}
				
				timeLine = new TimelineLite();
				timeLine.append( new TweenMax( this, 3, { y: y- 40, alpha:0.4, onComplete:showComplete  } ) );
			}
			else if( _type == TYPE_LEFTTORIGHT )
			{
				x=(stage.stageWidth)/5;
				y=(stage.stageHeight)/2+_offY;
				timeLine = new TimelineLite();
				timeLine.append( new TweenMax( this, 1.5, { x: x * 2  } ) );
				timeLine.append( new TweenMax( this, 2, { } ) );
				timeLine.append( new TweenMax( this, 1.5, { x: x * 3, alpha:0,onComplete:showComplete } ) );
			}
        }
        
        /**
         * 显示结束 
         * 
         */
        private function showComplete():void
        {
            if (_type == TYPE_MOUSE)
            {
				setTimeout(hideShow, 3000);
            }
            else if (_type == TYPE_STATIC)
            {
				setTimeout(hideShow, 3000);
            }
            else
            {
                hideShow();
            }
        }
        
        /**
         * 开始隐藏 
         * 
         */
        private function hideShow():void
        {
            var tweenParam:* = {};
            
            if (_type == TYPE_MOUSE)
            {
                tweenParam["alpha"] = 0;
                tweenParam["y"] = y + 100;
                tweenParam["onComplete"] = hideComplete;
                _tm = TweenMax.to(this, 1, tweenParam);
            }
            else if (_type == TYPE_MOUSE_UP_HIDE)
            {
                tweenParam["alpha"] = 0;
                tweenParam["onComplete"] = hideComplete;
                _tm = TweenMax.to(this, 1, tweenParam);
            }
            else if (_type == TYPE_MOUSE_UP)
            {
                tweenParam["alpha"] = 0;
                tweenParam["onComplete"] = hideComplete;
                _tm = TweenMax.to(this, 0.5, tweenParam);
            }
            else if (_type == TYPE_STATIC || _type == TYPE_UP_HIDE)
            {
                tweenParam["alpha"] = 0;
                tweenParam["onComplete"] = hideComplete;
                _tm = TweenMax.to(this, 1, tweenParam);
            }
            else
            {
                hideComplete();
            }
			
			hideComplete();
        }

        /**
         * 隐藏结束 
         * 
         */
        private function hideComplete():void
        {
            if (_tm != null)
            {
                _tm.kill();
                _tm = null;
            }
            
            MCUtil.removeSelf(this);
            listHash.remove(_gid);
			pool.push(this);
        }

        public function get gid():int
        {
            return _gid;
        }
        
        public function destory():void
        {
            if (_tm != null)
            {
                _tm.kill();
                _tm = null;
            }
            
            MCUtil.removeSelf(this);
            listHash.remove(_gid);
			pool.push(this);
        }
        private static var pool:Array=[];
    }
}