package org.mokylin.skin.app.mount.item
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountSkillGridSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgSpell:feathers.controls.UIAsset;

		public var isSelect:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountSkillGridSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 66;
			this.width = 67;
			this.elementsContent = [__MountSkillGridSkin_UIAsset1_i(),imgSpell_i(),isSelect_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountSkillGridSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang_1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgSpell_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSpell = temp;
			temp.name = "imgSpell";
			temp.height = 46;
			temp.width = 46;
			temp.x = 9;
			temp.y = 10;
			return temp;
		}

		private function isSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			isSelect = temp;
			temp.name = "isSelect";
			temp.styleName = "ui/common/grid/select/46.png";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

	}
}