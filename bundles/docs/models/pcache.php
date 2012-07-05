<?php
/**
 * PCache class
 *
 * ページキャッシュクラス
 *
 */
class PCache {

    /**
     * has
     * ページキャッシュが存在するか確認する
     *
     * @return Boolean 存在する場合true、しない場合false
     */
    static public function has() {

        return Cache::has(self::generate_key(URI::current()));
    }

    /**
     * get
     * ページキャッシュ取得
     *
     * @return mix 存在する場合、保存された内容、存在しない場合false
     */
    static public function get() {
        $value = Cache::get(self::generate_key(URI::current()));

        return $value ? : false;
    }

    /**
     * put
     * ページキャッシュ保存
     *
     * @param type $value
     * @return void
     */
    static public function put($value) {
        Cache::put(self::generate_key(URI::current()), $value, 30);
    }

    /**
     * generate_key
     * 指定されたidより、キャッシュ用のキーを生成する
     *
     * @param string ページ保存のキー
     * @return string 生成されたキー
     */
    static private function generate_key($id) {
        return strtr($id, '/', '+');
    }
}