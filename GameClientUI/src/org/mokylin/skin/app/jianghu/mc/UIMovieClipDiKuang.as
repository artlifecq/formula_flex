package org.mokylin.skin.app.jianghu.mc
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class UIMovieClipDiKuang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __UIMovieClipDiKuang_UIAsset1:feathers.controls.UIAsset;

		public var __UIMovieClipDiKuang_UIAsset2:feathers.controls.UIAsset;

		public var __UIMovieClipDiKuang_UIAsset3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function UIMovieClipDiKuang()
		{
			super();
			
			this.currentState = "3";
			this.elementsContent = [];
			__UIMovieClipDiKuang_UIAsset1_i();
			__UIMovieClipDiKuang_UIAsset2_i();
			__UIMovieClipDiKuang_UIAsset3_i();
			
			
			states = {
			};
			skinNames={"1":"ui/app/jianghu/lunjian/lvguang.png", "2":"ui/app/jianghu/lunjian/languang.png", "3":"ui/app/jianghu/lunjian/hongguang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __UIMovieClipDiKuang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__UIMovieClipDiKuang_UIAsset1 = temp;
			temp.styleName = "ui/app/jianghu/lunjian/lvguang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __UIMovieClipDiKuang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__UIMovieClipDiKuang_UIAsset2 = temp;
			temp.styleName = "ui/app/jianghu/lunjian/languang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __UIMovieClipDiKuang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__UIMovieClipDiKuang_UIAsset3 = temp;
			temp.styleName = "ui/app/jianghu/lunjian/hongguang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}