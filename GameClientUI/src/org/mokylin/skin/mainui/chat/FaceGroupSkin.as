package org.mokylin.skin.mainui.chat
{
	import feathers.data.ListCollection;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;

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
		public var __FaceGroupSkin_HorizontalLayout1:feathers.layout.HorizontalLayout;

		public var faceGroup:feathers.controls.Group;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FaceGroupSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 220;
			this.width = 240;
			this.elementsContent = [__FaceGroupSkin_UIAsset1_i(),faceGroup_i(),tabBar_i()];
			
			states = {
				init:[
						{target:"__FaceGroupSkin_HorizontalLayout1",
							name:"paddingLeft",
							value:2
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FaceGroupSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['表 情','心 情'];
			return temp;
		}

		private function __FaceGroupSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			__FaceGroupSkin_HorizontalLayout1 = temp;
			temp.paddingRight = 2;
			return temp;
		}

		private function __FaceGroupSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 220;
			temp.styleName = "ui/mainui/chat/di.png";
			temp.width = 240;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function faceGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			faceGroup = temp;
			temp.name = "faceGroup";
			temp.height = 220;
			temp.width = 240;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 59;
			temp.height = 26;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonSkin_channel;
			temp.width = 155;
			temp.x = 2;
			temp.y = -20;
			temp.layout = __FaceGroupSkin_HorizontalLayout1_i();
			temp.dataProvider = __FaceGroupSkin_ArrayCollection1_i();
			return temp;
		}

	}
}