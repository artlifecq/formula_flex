package org.mokylin.skin.app.maze
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
	public class MazeMonsterRankPageSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MazeMonsterRankPageSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 328;
			this.width = 240;
			this.elementsContent = [__MazeMonsterRankPageSkin_UIAsset1_i(),__MazeMonsterRankPageSkin_Label1_i(),__MazeMonsterRankPageSkin_Label2_i(),__MazeMonsterRankPageSkin_Label3_i(),__MazeMonsterRankPageSkin_Label4_i(),__MazeMonsterRankPageSkin_UIAsset2_i(),__MazeMonsterRankPageSkin_UIAsset3_i(),__MazeMonsterRankPageSkin_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MazeMonsterRankPageSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "姓名";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 124;
			temp.y = 3;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "国家";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 47;
			temp.y = 3;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "时间";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 197;
			temp.y = 1;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "圣兽";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 1;
			temp.y = 2;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-bg.png";
			temp.width = 240;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 37;
			temp.y = 0;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function __MazeMonsterRankPageSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 185;
			temp.y = 0;
			return temp;
		}

	}
}