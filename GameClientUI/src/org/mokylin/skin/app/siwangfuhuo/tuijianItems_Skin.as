package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.siwangfuhuo.Itemkuang_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class tuijianItems_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var uiName:feathers.controls.UIAsset;

		public var ui_ico:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function tuijianItems_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 190;
			this.width = 141;
			this.elementsContent = [btn_i(),uiName_i(),ui_ico_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.Itemkuang_Skin;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/siwangfuhuo/name/2.png";
			temp.x = 40;
			temp.y = 11;
			return temp;
		}

		private function ui_ico_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_ico = temp;
			temp.name = "ui_ico";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/siwangfuhuo/icon/2.png";
			temp.x = 19;
			temp.y = 56;
			return temp;
		}

	}
}