package org.mokylin.skin.mainui.chat
{
	import feathers.data.ListCollection;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_Type;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FaceGroupSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_Title:feathers.controls.Label;

		public var tab_Face:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FaceGroupSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 263;
			this.width = 241;
			this.elementsContent = [__FaceGroupSkin_UIAsset1_i(),__FaceGroupSkin_UIAsset2_i(),__FaceGroupSkin_UIAsset3_i(),lbl_Title_i(),tab_Face_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FaceGroupSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['普通表情','心情表情'];
			return temp;
		}

		private function __FaceGroupSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __FaceGroupSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 264;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.width = 245;
			temp.x = -2;
			temp.y = 0;
			return temp;
		}

		private function __FaceGroupSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 234;
			temp.x = 4;
			temp.y = 230;
			return temp;
		}

		private function __FaceGroupSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 33;
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg1.png";
			temp.x = 34;
			temp.y = 2;
			return temp;
		}

		private function lbl_Title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_Title = temp;
			temp.name = "lbl_Title";
			temp.bold = false;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "普通表情";
			temp.color = 0xCFC6AE;
			temp.x = 83;
			temp.y = 8;
			return temp;
		}

		private function tab_Face_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_Face = temp;
			temp.name = "tab_Face";
			temp.btnWidth = 69;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_Type;
			temp.x = 3;
			temp.y = 234;
			temp.layout = __FaceGroupSkin_HorizontalLayout1_i();
			temp.dataProvider = __FaceGroupSkin_ArrayCollection1_i();
			return temp;
		}

	}
}