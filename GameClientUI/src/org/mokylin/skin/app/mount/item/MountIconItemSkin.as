package org.mokylin.skin.app.mount.item
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountIconItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var group:feathers.controls.Group;

		public var img:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var imgSelect:feathers.controls.UIAsset;

		public var imgSelect1:feathers.controls.UIAsset;

		public var imgStatue:feathers.controls.UIAsset;

		public var suo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountIconItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 67;
			this.width = 65;
			this.elementsContent = [group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountIconItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 60;
			temp.styleName = "ui/common/kang/mount/di_kuang.png";
			temp.width = 61;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.x = -4;
			temp.y = -4;
			temp.elementsContent = [__MountIconItemSkin_UIAsset1_i(),imgBg_i(),imgSelect_i(),imgSelect1_i(),img_i(),imgStatue_i(),suo_i()];
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 11;
			temp.y = 10;
			return temp;
		}

		private function imgSelect1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSelect1 = temp;
			temp.name = "imgSelect1";
			temp.height = 74;
			temp.styleName = "ui/common/grid/quality/60_4.png";
			temp.width = 74;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSelect = temp;
			temp.name = "imgSelect";
			temp.height = 74;
			temp.styleName = "ui/common/grid/quality/60_4.png";
			temp.width = 74;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgStatue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgStatue = temp;
			temp.name = "imgStatue";
			temp.height = 23;
			temp.styleName = "n/zhan-.png";
			temp.width = 25;
			temp.x = 41;
			temp.y = 3;
			return temp;
		}

		private function img_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img = temp;
			temp.name = "img";
			temp.height = 46;
			temp.width = 46;
			temp.x = 14;
			temp.y = 13;
			return temp;
		}

		private function suo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			suo = temp;
			temp.name = "suo";
			temp.styleName = "ui/common/icon/suo.png";
			temp.x = 27;
			temp.y = 24;
			return temp;
		}

	}
}