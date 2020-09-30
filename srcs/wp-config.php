<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'dselmy_db' );

/** MySQL database username */
define( 'DB_USER', 'dselmy' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/** Filesystem operation method. */
define( 'FS_METHOD', 'direct' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '@K)qc5dAKc3|82(w4TBH-b7rk<!#?FB14$1QX[m>c;Dq6jL 3Ng-b@CUCEX|z_bL');
define('SECURE_AUTH_KEY',  '#sKUeyahJ[+;od8.wS!pn|MA^ P#fmi|r}7!a]fYw&fdjifyw0D22K{lYN0@k^#e');
define('LOGGED_IN_KEY',    ')hZ2>tIcA+AFrHkvoM0V_@.QT%7lezjPW|^H7tVlaW5ABCARI}y+5jFZfgF+w2&v');
define('NONCE_KEY',        'mcS!NOW]v:VKgGTLpfzVM]b!E1>DfZf+m8D|Ulcix Z^Cp% f6;Y;q-oOcqeTo1m');
define('AUTH_SALT',        ';f2[~BijU&|Gk|q*Mgrj}`+PWmsO/B#$;^`2t^^+GS)JppT{A+o$L,<fS f;8NF;');
define('SECURE_AUTH_SALT', 'VBj^P@vkZd{w?-mR`;<&M )lK,zL~&1;TCJ3V?|jUGwLw@Btr!ut+,=/2]+=@Eqt');
define('LOGGED_IN_SALT',   ':mCz1lZg7:xM{XZ|[n`gr$tp7Ei;sH6@1WG^1W3C;ITj!C{h*` Zg[wpLv[XOlGD');
define('NONCE_SALT',       '4iI6(UInT)(/VnP!I!Bjj $yvvL7+-fl_gu NhZQo*C3#wUx|cBT_`][SVp+hi<z');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
