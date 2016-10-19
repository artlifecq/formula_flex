package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendBlackItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var name:feathers.controls.Label;

		public var select:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendBlackItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 26;
			this.width = 280;
			this.elementsContent = [select_i(),__FriendBlackItemrenderSkin_UIAsset1_i(),__FriendBlackItemrenderSkin_UIAsset2_i(),name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendBlackItemrenderSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.alpha = 0.01;
			temp.height = 24;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FriendBlackItemrenderSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/friend/feng-ge.png";
			temp.width = 180;
			temp.x = 100;
			temp.y = 23;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 157;
			temp.x = 7;
			temp.y = 2;
			return temp;
		}

		private function select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select = temp;
			temp.name = "select";
			temp.height = 26;
			temp.left = 0;
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong.png";
			temp.top = 0;
			temp.width = 280;
			return temp;
		}

	}
}